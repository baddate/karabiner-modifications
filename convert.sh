#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <input.{yml,yaml,json}> [output]"
    exit 1
fi

input="$1"
output="${2:-}"

if ! command -v yq >/dev/null 2>&1; then
    echo "Error: yq is not installed."
    echo "macOS: brew install yq"
    echo "Arch Linux: sudo pacman -S yq"
    exit 1
fi

case "$input" in
    *.yml|*.yaml)
        if [[ -z "$output" ]]; then
            output="${input%.*}.json"
        fi

        yq -o=json '.' "$input" > "$output"
        ;;

    *.json)
        if [[ -z "$output" ]]; then
            output="${input%.json}.yml"
        fi

        yq -P -o=yaml '.' "$input" > "$output"
        ;;

    *)
        echo "Error: unsupported file type: $input"
        exit 1
        ;;
esac

echo "$input -> $output"
