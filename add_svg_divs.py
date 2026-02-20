#!/usr/bin/env python3
"""
Usage: python add_svg_divs.py <input.qmd> <lecture_number>

After each \end{oltableau} in the input file, inserts a revealjs div that
references the corresponding SVG file, with an incrementing counter.

Example:
    python add_svg_divs.py Lecture_09.qmd 09
"""

import sys
import re

def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <input.qmd> <lecture_number>")
        sys.exit(1)

    input_file = sys.argv[1]
    lecture_num = sys.argv[2]

    with open(input_file, "r") as f:
        content = f.read()

    counter = [0]

    def replacement(match):
        counter[0] += 1
        svg_index = f"{counter[0]:02d}"
        div = (
            f"\\end{{oltableau}}\n\n"
            f"::: {{.content-visible when-format=\"revealjs\"}}\n"
            f"![]"
            f"(../images/tableaux-{lecture_num}/tableau-{lecture_num}-{svg_index}.tex.svg)\n"
            f":::"
        )
        return div

    new_content = re.sub(r"\\end\{oltableau\}", replacement, content)

    print(new_content)

if __name__ == "__main__":
    main()
