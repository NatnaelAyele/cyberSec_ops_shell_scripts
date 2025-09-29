#!/bin/bash
directory=~/secure_vault

if [ -d "$directory" ]; then
    for file in keys.txt secrets.txt logs.txt; do
        file_path="$directory/$file"
        if [ -f "$file_path" ]; then
            size=$(stat -c%s "$file_path")
            mod_date=$(stat -c%y "$file_path")
            permissions=$(stat -c%A "$file_path")
            echo "File name: $file" >> report.txt
            echo "Size: $size bytes" >> report.txt
            echo "Modified: $mod_date" >> report.txt
            echo "Permissions: $permissions" >> report.txt
        fi
    done
else
    echo "secure vault not found"
fi

