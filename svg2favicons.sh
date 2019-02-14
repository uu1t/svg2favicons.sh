#!/usr/bin/env bash
set -e

usage_exit() {
  echo "Convert SVG to PNG favicons of various sizes

Usage:
  svg2favicons.sh <svg> [<dir>]
  svg2favicons.sh -h

Arguments:
  <svg>  Input SVG file
  <dir>  Output directory in which icons are generated [default: \$PWD]

Options:
  -h  Show this screen
"
  exit $1
}

main() {
  local svg="$1"
  local dir="${2:-$PWD}"

  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi

  echo "Generate favicons in $dir..."

  convert -resize  16x -background  none "$svg" "$dir/favicon-16x16.png"
  convert -resize  32x -background  none "$svg" "$dir/favicon-32x32.png"
  convert -resize 144x -background  none "$svg" "$dir/msapplication-icon-144x144.png"
  convert -resize 152x -background white "$svg" "$dir/apple-touch-icon-152x152.png"
  convert -resize 192x -background  none "$svg" "$dir/android-chrome-192x192.png"
  convert -resize 512x -background  none "$svg" "$dir/android-chrome-512x512.png"

  convert "$dir/favicon-16x16.png" "$dir/favicon-32x32.png" "$dir/favicon.ico"
}

if [[ $# -lt 1 ]]; then
  usage_exit 1
elif [[ "$1" == "-h" ]]; then
  usage_exit 0
fi

main "$@"
