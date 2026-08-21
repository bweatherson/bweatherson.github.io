#!/usr/bin/env python3
"""
prep-images.py — turn full-resolution originals into slide-sized web images,
and check that nothing oversized has crept into the committed set.

Layout it assumes (relative to a course folder such as F26-Phil101):

    images/_originals/     full-resolution downloads. GITIGNORED. Never committed.
    images/                the derivatives this script writes. Committed.
                           Reference these from a deck as ../images/name.webp

Usage:

    python3 prep-images.py build            # convert originals -> derivatives
    python3 prep-images.py check            # flag anything oversized in images/
    python3 prep-images.py build --force    # rebuild even if up to date

Options:
    --dir PATH        course folder holding images/  (default: current directory)
    --max-width N     longest edge of the output, in pixels (default 1600)
    --quality N       WebP quality 1-100 (default 82)
    --force           ignore timestamps and rebuild everything

Why 1600: a reveal.js slide renders well under that logically, so 1600px covers
a full-bleed image on a 1080p projector with room to spare. Going higher costs
bytes twice over, because the site keeps a copy and every PDF embeds another.

Why JPEG and not WebP: the Typst that Quarto bundles rejects WebP outright with
"unknown image format", so a WebP deck renders to HTML and fails to PDF. JPEG is
about twice the size and works in both. Images with transparency go to PNG, since
JPEG has no alpha channel.

Requires Pillow:  pip install pillow
"""

import argparse
import shutil
import sys
from pathlib import Path

try:
    from PIL import Image
except ImportError:
    sys.exit("This needs Pillow. Install it with:  pip install pillow")

RASTER = {".jpg", ".jpeg", ".png", ".tif", ".tiff", ".bmp", ".webp"}
# WebP is accepted as an INPUT but never written as output; see the note above.
VECTOR = {".svg"}
# A committed raster image wider than this, or heavier than this, gets flagged.
CHECK_MAX_WIDTH = 2000
CHECK_MAX_BYTES = 900 * 1024


def fmt(n):
    for unit in ("B", "KB", "MB", "GB"):
        if n < 1024 or unit == "GB":
            return f"{n:.0f} {unit}" if unit == "B" else f"{n:.1f} {unit}"
        n /= 1024


def build(course_dir, max_width, quality, force):
    src = course_dir / "images" / "_originals"
    out = course_dir / "images"

    if not src.is_dir():
        sys.exit(f"No originals folder at {src}\nCreate it and put full-resolution files there.")
    out.mkdir(parents=True, exist_ok=True)

    made = skipped = 0
    before = after = 0
    problems = []

    for f in sorted(src.iterdir()):
        if f.name.startswith(".") or not f.is_file():
            continue
        ext = f.suffix.lower()

        if ext in VECTOR:
            target = out / f.name
            if force or not target.exists() or f.stat().st_mtime > target.stat().st_mtime:
                shutil.copy2(f, target)
                print(f"  copied  {f.name}  (vector, left alone)")
                made += 1
            else:
                skipped += 1
            continue

        if ext not in RASTER:
            problems.append(f"{f.name}: not an image type this script handles")
            continue

        # JPEG unless the image needs an alpha channel, in which case PNG.
        # Never WebP: Quarto's bundled Typst cannot read it.
        with Image.open(f) as probe:
            # An alpha channel that is fully opaque does not need preserving.
            # Screenshots are routinely saved RGBA with nothing transparent in
            # them, and sending those to PNG costs several times what JPEG does.
            needs_alpha = False
            if probe.mode in ("RGBA", "LA", "PA") or (
                    probe.mode == "P" and "transparency" in probe.info):
                a = probe.convert("RGBA").getchannel("A").getextrema()
                needs_alpha = a[0] < 255
        target = out / (f.stem + (".png" if needs_alpha else ".jpg"))
        if not force and target.exists() and target.stat().st_mtime >= f.stat().st_mtime:
            skipped += 1
            continue

        try:
            with Image.open(f) as im:
                w0, h0 = im.size
                if im.mode in ("P", "LA"):
                    im = im.convert("RGBA")
                elif im.mode == "CMYK":
                    im = im.convert("RGB")

                if max(im.size) > max_width:
                    im.thumbnail((max_width, max_width), Image.LANCZOS)

                # save with no EXIF / ICC baggage
                if target.suffix == ".png":
                    im.save(target, "PNG", optimize=True)
                else:
                    im.convert("RGB").save(target, "JPEG", quality=quality,
                                           optimize=True, progressive=True)
        except Exception as e:
            problems.append(f"{f.name}: {e}")
            continue

        b, a = f.stat().st_size, target.stat().st_size
        before += b
        after += a
        made += 1
        print(f"  {f.name}  {w0}x{h0} {fmt(b)}  ->  {target.name}  "
              f"{Image.open(target).size[0]}x{Image.open(target).size[1]} {fmt(a)}"
              f"  ({100*a/b:.0f}%)")

    print(f"\n{made} written, {skipped} already up to date")
    if before:
        print(f"originals {fmt(before)}  ->  derivatives {fmt(after)}  "
              f"({fmt(before-after)} saved, {100*after/before:.0f}% of original)")
    if problems:
        print("\nskipped with problems:")
        for p in problems:
            print("  " + p)
    return 0


def check(course_dir, max_width):
    out = course_dir / "images"
    if not out.is_dir():
        sys.exit(f"No images folder at {out}")

    flagged = []
    total = 0
    count = 0

    for f in sorted(out.rglob("*")):
        if not f.is_file() or f.name.startswith("."):
            continue
        if "_originals" in f.parts:
            continue  # not committed, not our problem
        ext = f.suffix.lower()
        if ext not in RASTER and ext not in VECTOR:
            continue

        size = f.stat().st_size
        total += size
        count += 1
        rel = f.relative_to(course_dir)

        if ext in VECTOR:
            if size > CHECK_MAX_BYTES:
                flagged.append(f"{rel}: SVG is {fmt(size)}, unusually heavy for a vector")
            continue

        try:
            with Image.open(f) as im:
                w, h = im.size
        except Exception as e:
            flagged.append(f"{rel}: could not read ({e})")
            continue

        if ext == ".webp":
            flagged.append(f"{rel}: WebP will fail the Typst render — rebuild it as .jpg")
            continue

        if max(w, h) > CHECK_MAX_WIDTH:
            flagged.append(f"{rel}: {w}x{h}, longest edge over {CHECK_MAX_WIDTH}px — rebuild it")
        elif size > CHECK_MAX_BYTES:
            flagged.append(f"{rel}: {fmt(size)} at {w}x{h} — heavy for its size, try a lower quality")

    print(f"{count} images in {out}, {fmt(total)} total")
    print(f"at this rate 28 decks of 10 images each would come to about "
          f"{fmt((total/count if count else 0) * 280)} in source, "
          f"roughly triple that once the site copy and the PDFs are counted.\n")

    if flagged:
        print(f"{len(flagged)} to look at:")
        for p in flagged:
            print("  " + p)
        return 1

    print("Nothing oversized. Safe to commit and render.")
    return 0


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("mode", choices=["build", "check"])
    ap.add_argument("--dir", default=".", help="course folder containing images/ (default: .)")
    ap.add_argument("--max-width", type=int, default=1600)
    ap.add_argument("--quality", type=int, default=82)
    ap.add_argument("--force", action="store_true")
    a = ap.parse_args()

    course = Path(a.dir).resolve()
    if a.mode == "build":
        sys.exit(build(course, a.max_width, a.quality, a.force))
    else:
        sys.exit(check(course, a.max_width))


if __name__ == "__main__":
    main()
