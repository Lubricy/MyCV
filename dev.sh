#!/usr/bin/env bash

set -exo pipefail

mkdir -p ./.cache
mkdir -p ./dist

# Directory with templates
SRC_DIR="./templates"

# Directory to save the processed files
DST_DIR="./sections"

# Data for rendering
DATA_FILE="data.yaml"

find "$SRC_DIR" -type f -name '*.tpl' | while read -r SRC_PATH; do

  # Create destination path by switching SRC_DIR with DST_DIR and removing .tpl extension
  DST_PATH="${SRC_PATH/$SRC_DIR/$DST_DIR}"
  DST_PATH="${DST_PATH%.*}"

  # Create directory if it does not exist
  mkdir -p "$(dirname "$DST_PATH")"

  # Render template and save it to destination path
  mustache data.yaml "$SRC_PATH" > "$DST_PATH"
done

latexmk -interaction=nonstopmode -pdf -xelatex -jobname='./.cache/%A-en' cv.tex
latexmk -interaction=nonstopmode -pdf -xelatex -jobname='./.cache/%A-cn' cv.tex
pdfunite ./.cache/cv-{en,cn}.pdf ./.cache/cv-merged.pdf
cp --no-preserve=mode,ownership ./.cache/cv-{en,cn,merged}.pdf ./dist && echo build updated.
