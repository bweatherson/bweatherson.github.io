#!/usr/bin/env python3
"""
Extract tableaux from a Quarto lecture file.
Usage: python3 extract_tableaux.py input_file.qmd output_dir lecture_num
"""

import sys
import re
import os

if len(sys.argv) != 4:
    print("Usage: python3 extract_tableaux.py input_file.qmd output_dir lecture_num")
    print("Example: python3 extract_tableaux.py Lecture_09.qmd tableaux-tex-09 09")
    sys.exit(1)

input_file = sys.argv[1]
output_dir = sys.argv[2]
lecture_num = sys.argv[3]

# Create output directory if it doesn't exist
os.makedirs(output_dir, exist_ok=True)

# Read the input file
with open(input_file, 'r') as f:
    content = f.read()

# Find all tableaux blocks
pattern = r'\\begin\{oltableau\}(.*?)\\end\{oltableau\}'
tableaux = re.findall(pattern, content, re.DOTALL)

print(f"Found {len(tableaux)} tableaux")

# Write each tableau to a separate file
for i, tableau in enumerate(tableaux, start=1):
    filename = os.path.join(output_dir, f'tableau-{lecture_num}-{i:02d}.tex.content')
    with open(filename, 'w') as f:
        f.write('\\begin{oltableau}\n')
        f.write(tableau.strip())  # Strip leading/trailing whitespace
        f.write('\n\\end{oltableau}\n')
    print(f"Extracted tableau {i} to {filename}")

print(f"\nTotal: {len(tableaux)} tableaux extracted")
