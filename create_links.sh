#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage:
    $0 \$source \$destination"
    exit 1
fi

source="$1"
if [ ! -d "$source" ]; then
    echo "Error: $source does not exist or is not a directory"
    exit 2
fi

destination="$2"
mkdir -p "$destination"

for f in "$source"/*; do
    g="$destination/$(basename -- "$f")"
    echo "[$f] => [$g]"
    rm "$g" 2>&1 >/dev/null
    ln "$f" "$g"
done
