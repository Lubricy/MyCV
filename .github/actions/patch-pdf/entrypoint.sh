#!/usr/bin/env bash

PATCHED_PDF="cv-patched-$(date +%Y%m%d).pdf"

# presudo patch
cp "$1" "$PATCHED_PDF"

echo "pdf=${PATCHED_PDF}" >> $GITHUB_OUTPUT

