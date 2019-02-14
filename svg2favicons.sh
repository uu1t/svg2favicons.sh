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

  svgexport "$svg" "$dir/favicon-16x16.png"               16:
  svgexport "$svg" "$dir/favicon-32x32.png"               32:
  svgexport "$svg" "$dir/msapplication-icon-144x144.png" 144:
  svgexport "$svg" "$dir/apple-touch-icon-152x152.png"   152: "svg { background: white; }"
  svgexport "$svg" "$dir/android-chrome-192x192.png"     192:
  svgexport "$svg" "$dir/android-chrome-512x512.png"     512:

  convert "$dir/favicon-16x16.png" "$dir/favicon-32x32.png" "$dir/favicon.ico"
}

if [[ $# -lt 1 ]]; then
  usage_exit 1
elif [[ "$1" == "-h" ]]; then
  usage_exit 0
fi

main "$@"
