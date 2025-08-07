#!/bin/bash

matrix='[["a","b"],["c","d"],["e"]]'

echo "$matrix" | jq '. | length'
