#!/bin/bash
directory=~/secure_vault
mkdir -p ~/secure_vault
cd secure_vault
touch keys.txt secrets.txt logs.txt
for file in keys.txt secrets.txt logs.txt; do
	echo "Welcome $USER" > $file
done

if [ -d "$directory" ]; then
	all_files_exist=true
	for file in *.txt; do
		if [ ! -f "$file" ]; then
			all_files_exist=false
			break
		fi
	done
	if [ "$all_files_exist" = true ]; then
		echo "All files are created successsfuly"
		ls -l
	else
		echo "Not all files are created"
	fi
else
	echo "Directory not found"
fi
