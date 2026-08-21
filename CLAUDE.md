# Repo-level notes

This file applies to every course folder in this repo. Each course also has its
own `CLAUDE.md` covering that course; this one holds what is true everywhere.

Mostly that means Quarto behaviour that has cost us time more than once. The rule
for adding to it: if the same fix has had to be applied by hand in two different
files, it belongs here.

## Quarto gotchas

### Content after an incremental list appears immediately

`F26-Phil101/slides/_metadata.yml` and `F26-Phil444/slides/_metadata.yml` both set
`incremental: true`, so every list in those decks is incremental by default. That
default is the one we want. It has one consequence that is easy to forget, and it
comes up often.

Quarto marks the list items as reveal.js fragments and leaves the rest of the
slide alone. Reveal hides a pending fragment with `visibility: hidden`, which
keeps the space it will eventually occupy. So a slide written like this:

    ## Heading

    Intro sentence.

    * Bullet 1
    * Bullet 2

    Summary sentence

loads showing the intro sentence, then a gap the height of two bullets, then the
summary sentence. The summary was never marked as a fragment, so it was never
going to wait its turn.

The fix is a pause after the list:

    ## Heading

    Intro sentence.

    * Bullet 1
    * Bullet 2

    . . .

    Summary sentence

`. . .` and wrapping the summary in `::: {.fragment}` produce identical HTML
(`<div class="fragment">`), so use whichever reads better in the source. Either
way the summary costs one extra click, which is usually what was wanted anyway.

Worth remembering:

- This applies to anything after the list, not only prose. A table, an image, or
  a second list behaves the same way.
- It applies to prose sitting between two incremental lists.
- No pause is needed when the list is the last thing on the slide.
- There is no global setting for it. It has to be done slide by slide, so it is
  worth checking for whenever a deck is drafted or revised.
- To have the following content visible from the start instead, mark the list
  `::: {.nonincremental}`.

If Quarto ever changes this, the pauses stay harmless, so nothing here needs
undoing later.

### Side-by-side columns: use `layout`, not `.columns`

`::: {.columns}` with `::: {.column width="50%"}` inside it is a reveal.js
feature. It renders side by side in HTML and silently stacks in Typst, which
means a deck can look right on screen and wrong in the handout PDF with no error
to warn you. Both course folders render slides to `clean-typst` as well as
revealjs, so `.columns` should not be used in either.

Write it this way instead:

    :::: {layout="[50,50]"}

    ::: {}

    left-hand content

    :::

    ::: {}

    right-hand content

    :::

    ::::

`layout` works in both formats. Keep the outer fence at four colons and the inner
ones at three, so the nesting is unambiguous.

Captioned tables and figures survive this. Two tables with `{#tbl-...}` IDs
inside one `layout` div stay separate figures, keep their labels, number in
sequence, and `@tbl-` references to them still resolve. They do not collapse into
a subfigure panel.

One thing to watch: inside a `layout` div, `![Alt text](pic.jpg)` prints "Alt
text" as a visible caption. If it was meant as alt text rather than a caption,
write `![](pic.jpg){fig-alt="Alt text"}`.

### WebP images break the PDF render

The Typst that Quarto bundles rejects WebP with `unknown image format`. A deck
using a `.webp` image renders to HTML and then fails to PDF. Standalone Typst
handles WebP, so testing outside Quarto will not reproduce this.

`tools/prep-images.py` writes JPEG, or PNG when an image genuinely needs an alpha
channel, and never WebP. `python3 tools/prep-images.py check --dir <course>`
flags any committed `.webp` before it reaches a render.
