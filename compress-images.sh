#!/bin/bash

while [ $# -gt 0 ]; do
  case "$1" in
    --dir=*)
      dir="${1#*=}"
      ;;
    --ext=*)
      ext="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

files="$(find -L "$dir" -type f -name "$ext")"
countFiles=$(echo -n "$files" | wc -l)
echo "Count: $countFiles"
echo "$files" | while read file; do
 jpegoptim $file
done


