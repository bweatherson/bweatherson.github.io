#!/bin/bash

# Script to extract and compile tableaux from a Quarto lecture file
# Usage: ./extract-and-compile-tableaux.sh Lecture_XX.qmd output-number

if [ $# -lt 2 ]; then
    echo "Usage: $0 <lecture_file.qmd> <output_number>"
    echo "Example: ./extract-and-compile-tableaux.sh Lecture_09.qmd 09"
    exit 1
fi

LECTURE_FILE="$1"
OUTPUT_NUM="$2"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -f "$LECTURE_FILE" ]; then
    echo "Error: File $LECTURE_FILE not found"
    exit 1
fi

# Check for extract_tableaux.py
if [ ! -f "$SCRIPT_DIR/extract_tableaux.py" ]; then
    echo "Error: extract_tableaux.py not found in $SCRIPT_DIR"
    exit 1
fi

# Create directories
mkdir -p "../images/tableaux-${OUTPUT_NUM}"
mkdir -p "tableaux-tex-${OUTPUT_NUM}"

echo "Extracting tableaux from $LECTURE_FILE..."

# Run Python extraction
python3 "$SCRIPT_DIR/extract_tableaux.py" "$LECTURE_FILE" "tableaux-tex-${OUTPUT_NUM}" "$OUTPUT_NUM"

# Check if any tableaux were extracted
if [ ! "$(ls -A tableaux-tex-${OUTPUT_NUM}/*.content 2>/dev/null)" ]; then
    echo "Error: No tableaux found in $LECTURE_FILE"
    exit 1
fi

echo ""
echo "Creating complete .tex files..."

# Process each extracted tableau
for content_file in "tableaux-tex-${OUTPUT_NUM}"/*.content; do
    if [ -f "$content_file" ]; then
        # Get base filename
        basename=$(basename "$content_file" .content)
        tex_file="tableaux-tex-${OUTPUT_NUM}/${basename}.tex"
        
        echo "Creating $tex_file..."
        
        # Write the preamble - matching your working preambles exactly
        cat > "$tex_file" << 'PREAMBLE'
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{hyphens}{url}
\PassOptionsToPackage{dvipsnames,svgnames,x11names}{xcolor}
\documentclass[border=2pt]{standalone}

% Use modern fonts (requires XeLaTeX)
\usepackage{fontspec}
\usepackage{unicode-math}
\usepackage[dvipsnames]{xcolor}
\usepackage{pifont}
\setmainfont{Fira Sans}
\setmathfont{Fira Math}
\setmathfont[range=\mathbb]{Fira Math}

% Ensure amssymb is loaded for \lozenge and \square
\usepackage{amssymb}

% Tableaux system
\RequirePackage[tableaux]{prooftrees}
\forestset{line numbering, 
        check with={\textcolor{ForestGreen}{\text{\ding{52}}}},
        close with format={red}}

% Open Logic commands - provides tableau commands
\usepackage{open-logic-minimal}

% Redefine sFmla to ensure math mode for symbols
\renewcommand{\sFmla}[2]{\ensuremath{#1 \; #2}}

% Define the tableau environment
\newenvironment{oltableau}{\tableau{}}{\endtableau}

% Define True/False symbols
\usepackage[bb=boondox]{mathalfa}
\DeclareMathAlphabet{\mathbx}{U}{BOONDOX-ds}{m}{n}
\def\True{\mathbb{T}}
\def\False{\mathbb{F}}

% Define modal operators (using Unicode with unicode-math)
\newcommand{\Diamond}{◇}
\newcommand{\Box}{□}

% Assumption code
\newcommand*{\DeclareDocumentMacro}[2]{\def#1{#2}}
\DeclareDocumentMacro \TAss {Assumption}

\begin{document}

PREAMBLE
        
        # Append the tableau content (exactly as extracted)
        cat "$content_file" >> "$tex_file"
        
        # Close the document
        echo "" >> "$tex_file"
        echo "\end{document}" >> "$tex_file"
        
        # Remove the .content file
        rm "$content_file"
    fi
done

echo ""
echo "Compiling tableaux to PDF and SVG..."

success_count=0
fail_count=0

# Compile each .tex file
for texfile in "tableaux-tex-${OUTPUT_NUM}"/tableau-${OUTPUT_NUM}-*.tex; do
    if [ -f "$texfile" ]; then
        basename=$(basename "$texfile" .tex)
        echo -n "Compiling $basename... "
        
        # Clean up any existing files first
        rm -f "../images/tableaux-${OUTPUT_NUM}/${basename}.pdf"
        rm -f "../images/tableaux-${OUTPUT_NUM}/${basename}.aux"
        rm -f "../images/tableaux-${OUTPUT_NUM}/${basename}.log"
        
        # Compile to PDF using xelatex
        xelatex -interaction=nonstopmode -output-directory="../images/tableaux-${OUTPUT_NUM}" "$texfile" > /dev/null 2>&1
        
        if [ -f "../images/tableaux-${OUTPUT_NUM}/${basename}.pdf" ]; then
            # Convert PDF to SVG
            if command -v pdf2svg &> /dev/null; then
                pdf2svg "../images/tableaux-${OUTPUT_NUM}/${basename}.pdf" "../images/tableaux-${OUTPUT_NUM}/${basename}.svg"
                
                # Normalize SVG size
                if [[ "$OSTYPE" == "darwin"* ]]; then
                    sed -i '' 's/width="[^"]*" height="[^"]*"//' "../images/tableaux-${OUTPUT_NUM}/${basename}.svg"
                else
                    sed -i 's/width="[^"]*" height="[^"]*"//' "../images/tableaux-${OUTPUT_NUM}/${basename}.svg"
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
            # Show errors
            if [ -f "../images/tableaux-${OUTPUT_NUM}/${basename}.log" ]; then
                echo "  Errors:"
                grep "^!" "../images/tableaux-${OUTPUT_NUM}/${basename}.log" 2>/dev/null | head -5
            fi
        fi
    fi
done

# Clean up auxiliary files
rm -f "../images/tableaux-${OUTPUT_NUM}"/*.aux 
rm -f "../images/tableaux-${OUTPUT_NUM}"/*.log 
rm -f "../images/tableaux-${OUTPUT_NUM}"/*.pdf

echo ""
echo "================================"
echo "Done! Created $success_count SVG files"
[ $fail_count -gt 0 ] && echo "Failed: $fail_count files"
echo "Output directory: ../images/tableaux-${OUTPUT_NUM}/"
echo "================================"
