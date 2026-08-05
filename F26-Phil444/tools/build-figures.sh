#!/bin/sh
# Compile each TikZ figure to a standalone PDF and an SVG for the book.
#
#   HTML uses the SVG. Quarto converts the SVG for PDF output, but the PDF is
#   written here too in case you would rather reference that directly.
#
# Fonts. The book sets EB Garamond Math for both text and maths. That font is
# a custom build with the maths characters added and has no bold or italic, so
# those are borrowed from the stock EB Garamond faces, exactly as in
# notes/_quarto.yml. Because the SVG carries its glyphs as outlines, this is
# also what makes the maths inside the figures come out right in the HTML,
# where MathJax cannot reach a local font.
#
# If EB Garamond Math is not installed the figures fall back to the LaTeX
# defaults so the build still succeeds. That is what happens in the Cowork
# device VM, which has LaTeX but no user fonts. Re-run this on a machine with
# the fonts to get figures that match the body text.
#
# Usage:  sh tools/build-figures.sh
set -e
cd "$(dirname "$0")/.."
SRC=notes/figures/tikz
PDF=notes/figures/pdf
SVG=notes/figures/svg
mkdir -p "$PDF" "$SVG"
TMP=$(mktemp -d)
FELL=0

for f in "$SRC"/*.tex; do
  b=$(basename "$f" .tex)
  cat > "$TMP/$b.tex" <<EOF
\\documentclass[border=4pt]{standalone}
\\usepackage{fontspec}
\\usepackage{unicode-math}
\\usepackage{tikz}
\\usepackage{amsmath}
\\IfFontExistsTF{EB Garamond Math}{%
  \\setmainfont{EB Garamond Math}[%
    BoldFont       = EB Garamond SemiBold,
    ItalicFont     = EB Garamond Italic,
    BoldItalicFont = EB Garamond SemiBold Italic]%
  \\setmathfont{EB Garamond Math}%
}{\\typeout{BUILDFIGS: EB Garamond Math not found, using defaults}}
\\begin{document}
\\input{$(pwd)/$SRC/$b.tex}
\\end{document}
EOF
  (cd "$TMP" && xelatex -interaction=batchmode "$b.tex" >/dev/null 2>&1) || {
    echo "  FAILED: $b"; continue; }
  grep -q "BUILDFIGS: EB Garamond Math not found" "$TMP/$b.log" && FELL=1
  cp "$TMP/$b.pdf" "$PDF/$b.pdf"
  pdftocairo -svg "$PDF/$b.pdf" "$SVG/$b.svg"
  echo "  built $b"
done
rm -rf "$TMP"
if [ "$FELL" = "1" ]; then
  echo
  echo "  NOTE: EB Garamond Math was not found, so these were built with the"
  echo "  LaTeX default fonts and will not match the body text."
fi
echo "PDFs in $PDF, SVGs in $SVG"
