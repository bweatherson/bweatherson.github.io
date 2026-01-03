#!/bin/bash

# Script to compile tableau .tex files to SVG images
# Usage: ./compile-tableaux.sh

# Create directories if they don't exist
mkdir -p ../images/tableaux
mkdir -p tableaux-tex

# Process all .tex files in tableaux-tex directory
for texfile in tableaux-tex/*.tex; do
    if [ -f "$texfile" ]; then
        basename=$(basename "$texfile" .tex)
        echo "Processing $basename..."
        
        # Compile to PDF using xelatex for better fonts
        xelatex -output-directory=../images/tableaux "$texfile"
        
        # Convert PDF to SVG (requires pdf2svg)
        pdf2svg "../images/tableaux/${basename}.pdf" "../images/tableaux/${basename}.svg"
        
        # Normalize SVG size by removing width/height attributes
        sed -i '' 's/width="[^"]*" height="[^"]*"//' "../images/tableaux/${basename}.svg"

        # Optional: Convert to PNG (requires ImageMagick)
        # convert -density 300 "images/tableaux/${basename}.pdf" -quality 100 "images/tableaux/${basename}.png"
        
        echo "Created ../images/tableaux/${basename}.svg"
    fi
done

# Clean up auxiliary files
rm -f ../images/tableaux/*.aux ../images/tableaux/*.log

echo "Done! Tableau images are in ../images/tableaux/"
