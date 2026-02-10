#!/bin/bash

# Script to extract and compile tableaux from Lecture 09 to SVG images
# Usage: ./compile-lecture09-tableaux.sh Lecture_09.qmd

if [ $# -eq 0 ]; then
    echo "Usage: $0 <lecture_file.qmd>"
    echo ""
    echo "This script requires extract_tableaux.py to be in the same directory"
    exit 1
fi

LECTURE_FILE="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -f "$LECTURE_FILE" ]; then
    echo "Error: File $LECTURE_FILE not found"
    exit 1
fi

if [ ! -f "$SCRIPT_DIR/extract_tableaux.py" ]; then
    echo "Error: extract_tableaux.py not found in $SCRIPT_DIR"
    exit 1
fi

# Create directories if they don't exist
mkdir -p images/tableaux-09
mkdir -p tableaux-tex-09

echo "Extracting tableaux from $LECTURE_FILE..."

# Run the Python extraction script
python3 "$SCRIPT_DIR/extract_tableaux.py" "$LECTURE_FILE" tableaux-tex-09

# Check if any tableaux were extracted
if [ ! "$(ls -A tableaux-tex-09/*.content 2>/dev/null)" ]; then
    echo "Error: No tableaux found in $LECTURE_FILE"
    exit 1
fi

echo ""
echo "Creating complete .tex files..."

# Create complete .tex files with preamble for each extracted tableau
for content_file in tableaux-tex-09/*.content; do
    if [ -f "$content_file" ]; then
        basename=$(basename "$content_file" .content)
        tex_file="tableaux-tex-09/${basename}.tex"
        
        echo "Creating $tex_file..."
        
        # Create preamble
        cat > "$tex_file" << 'PREAMBLE'
\documentclass[border=2pt]{standalone}
\usepackage{amsmath,amssymb}
\usepackage[T1]{fontenc}
\usepackage{lmodern}

% Tableau packages
\usepackage{tikz}
\usepackage{forest}

% Define tableau commands
\newcommand{\True}{\mathbb{T}}
\newcommand{\False}{\mathbb{F}}
\newcommand{\TAss}{Assumption}
\newcommand{\TRule}[2]{#2}
\newcommand{\lif}{\rightarrow}

% Commands for different tableau formula types
\newcommand{\sFmla}[2]{$#1#2$}

% OLP-style tableau formatting
\forestset{
  close/.style={before drawing tree={tikz+={\node[fill=white,draw,circle,inner sep=1pt] at (.parent) {$\otimes$};}}},
  just/.style={edge label={node[midway,right,font=\scriptsize]{#1}}},
  tableau/.style={for tree={s sep=2mm, inner sep=1mm, l=0mm, parent anchor=south, child anchor=north}},
}

\begin{document}
\begin{forest}
tableau
PREAMBLE
        
        # Use sed to extract just the tableau content (between begin and end)
        # This handles multi-line content properly
        sed -n '/\\begin{oltableau}/,/\\end{oltableau}/p' "$content_file" | \
          sed '1d;$d' >> "$tex_file"
        
        # Close the document
        cat >> "$tex_file" << 'POSTAMBLE'
\end{forest}
\end{document}
POSTAMBLE
        
        rm "$content_file"
    fi
done

echo ""
echo "Compiling tableaux to PDF and SVG..."

success_count=0
fail_count=0

for texfile in tableaux-tex-09/tableau-09-*.tex; do
    if [ -f "$texfile" ]; then
        basename=$(basename "$texfile" .tex)
        echo -n "Compiling $basename... "
        
        # Compile to PDF
        pdflatex -interaction=nonstopmode -output-directory=images/tableaux-09 "$texfile" > /dev/null 2>&1
        
        if [ -f "images/tableaux-09/${basename}.pdf" ]; then
            # Convert PDF to SVG
            if command -v pdf2svg &> /dev/null; then
                pdf2svg "images/tableaux-09/${basename}.pdf" "images/tableaux-09/${basename}.svg"
                
                # Normalize SVG
                if [[ "$OSTYPE" == "darwin"* ]]; then
                    sed -i '' 's/width="[^"]*" height="[^"]*"//' "images/tableaux-09/${basename}.svg"
                else
                    sed -i 's/width="[^"]*" height="[^"]*"//' "images/tableaux-09/${basename}.svg"
                fi
                
                echo "✓"
                ((success_count++))
            else
                echo "✗ (pdf2svg not found)"
                ((fail_count++))
            fi
        else
            echo "✗ (compilation failed)"
            ((fail_count++))
            # Show last few errors
            if [ -f "images/tableaux-09/${basename}.log" ]; then
                echo "  Last errors:"
                grep "^!" "images/tableaux-09/${basename}.log" | tail -5
            fi
        fi
    fi
done

# Clean up
rm -f images/tableaux-09/*.aux images/tableaux-09/*.log images/tableaux-09/*.pdf

echo ""
echo "================================"
echo "Done! Created $success_count SVG files"
[ $fail_count -gt 0 ] && echo "Failed: $fail_count files"
echo "Output directory: images/tableaux-09/"
echo "================================"
