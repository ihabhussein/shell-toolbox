#!/bin/sh

here=$(dirname -- "$0")
for f in $(grep -l __DATA__ "$here"/bin/*); do
    pod2man "$f" "$here/man/$(basename "$f").1"
done
