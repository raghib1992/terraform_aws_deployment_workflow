#!/bin/bash

# matrix='[["a","b"],["c","d"],["e"]]'

# echo "$matrix" | jq '. | length'
set -euo pipefail

# Find all directories containing Terraform files (*.tf), excluding .terraform cache
TF_DIRS=(
  $(find . -type f -name '*.tf' \
      -not -path '*/.terraform/*' \
      -exec dirname {} \; \
    | sed 's#^\./##' \
    | sort -u)
)

# Join with ", " between items
OUTPUT=$(IFS=, ; echo "[${TF_DIRS[*]}]")

# Ensure there's a space after commas for readability
echo "${OUTPUT//,/, }"