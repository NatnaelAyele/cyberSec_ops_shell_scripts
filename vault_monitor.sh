#!/bin/bash
directory=~/secure_vault

if [ -d "$directory" ]; then
    for file in keys.txt secrets.txt logs.txt; do
        file_path="$directory/$file"
        if [ -f "$file_path" ]; then
            size=$(stat -c%s "$file_path")
            mod_date=$(stat -c%y "$file_path")
            permissions=$(stat -c%A "$file_path")
            echo "File name: $file" >> "$directory/vault_report.txt"
            echo "Size: $size bytes" >> "$directory/vault_report.txt"
            echo "Modified: $mod_date" >> "$directory/vault_report.txt"
            echo "Permissions: $permissions" >> "$directory/vault_report.txt"
	    echo >> "$directory/vault_report.txt"
        
	   perm=$(stat -c "%a" "$file_path")
	   group=${perm:1:1}
	   others=${perm:2:1}
	   if [[ "$group" != "4" && "$group" != "0" ]] || [[ "$others" != "4" && "$others" != "0" ]]; then 
    		echo "⚠️ SECURITY RISK DETECTED"
	   fi
	fi
    done
    echo "Report created successfully"
else
    echo "secure vault not found"
fi

