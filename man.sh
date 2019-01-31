#!/bin/sh

here=$(dirname -- "$0")

for f in $(grep -l __DATA__ "$here"/bin/*); do
    g=$(basename "$f")
    pod2man "$f" "$here/man/$g.1"
done

for f in $(grep -l '<< *HELP_TEXT' "$here"/bin/* "$here"/lib/*); do
    g=$(basename "$f")
    sed "1,/<< *HELP_TEXT/d; s/__CMD__/$g/g;" < "$f" > "$here/man/$g.1"
done
