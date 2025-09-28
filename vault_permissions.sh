#!/bin/bash

change_permission () {
    file=$1
    read -p "enter file permission in numeric value. eg(600)" permission
    if [ -z "$permission" ]; then
        case $file in
            keys.txt)
                chmod 600 $file
                echo "Empty input; permission changed to default"
                ;;
            secrets.txt)
                chmod 640 $file
                echo "Empty input; permission changed to default"
                ;;
            logs.txt)
                chmod 644 $file
                echo "Empty input; permission changed to default"
                ;;
            *)
                echo "Encountered some ERROR"
                ;;
        esac
    else
        chmod "$permission" "$file"
        echo "file permission changed successfully"
    fi
}

dir=~/secure_vault
if [ -d "$dir" ]; then
    cd "$dir"
    for file in keys.txt secrets.txt logs.txt; do
        if [ -f "$file" ]; then
            echo "Current file permission is:"
            ls -l $file
            echo
            read -p "Do you want to change permission (y/n)?" choice
            if [ "$choice" = "y" ]; then
                change_permission $file
            else
                echo "File Permission is unchanged"
            fi
        else
            echo "ERROR: file not found"
        fi
    done
else
    echo "directory not found"
fi

