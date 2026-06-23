#!/bin/bash

INPUT_FILE="$1"
SUBJECT="$2"
OUTPUT_FILE="${INPUT_FILE%.pdf}_compressed.pdf"

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dBATCH -sOutputFile="$OUTPUT_FILE" -c "[ /Title (Arcana Mechanica) /Subject ($SUBJECT) /DOCINFO pdfmark" -f "$INPUT_FILE"
