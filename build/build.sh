#!/bin/bash

cd ..

# Versuche den aktuellsten Git-Tag auszulesen. Wenn es keinen gibt, nutze "v0.0.0"
VERSION=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")

# Schreibe die Version als Typst-Variable in die Datei version.typ
echo "#let app_version = \"$VERSION\"" > version.typ

# Starte die eigentliche Kompilierung
typst compile neo-srd.typ generated/srd_export.pdf
