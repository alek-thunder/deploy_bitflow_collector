#!/bin/bash
set -e
home=`dirname $(readlink -e $0)`

rm -f "$home/ansible-inventory.ini" &> /dev/null
echo "Generating inventory..."
"$home/scripts/generate-project-inventory.sh" --hypervisors >> "$home/ansible-inventory.ini"

test -f "$home/ansible-inventory-extra.ini" && cat "$home/ansible-inventory-extra.ini" >> "$home/ansible-inventory.ini"

