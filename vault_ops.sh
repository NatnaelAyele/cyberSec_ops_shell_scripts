#!/bin/bash

add_secret () {
	read -rp "Enter your secrete here: " secret
	echo "$secret" >> ~/secure_vault/secrets.txt
	echo "secret added"
}

update_secret () {
	read -rp "write the secret you want to replace" old_secret
if grep -q "$old_secret" ~/secure_vault/secrets.txt; then

	read -rp "write the new secret to replace with" new_secret
	sed -i "s/$old_secret/$new_secret/g" ~/secure_vault/secrets.txt
	echo "secrete updated successfully"
else 
	echo "The secrete entered is not found!"
fi

}

log_entry () {
	echo "$(date '+%Y-%m-%d %H:%M:%S')" >> ~/secure_vault/logs.txt
	echo "log saved"
}

access_key () {
	echo "ACCESS DENIED"
}

while true
do
    echo "====================="
    echo "       MAIN MENU     "
    echo "====================="
    echo "1) Add Secret"
    echo "2) Update Secret"
    echo "3) Add log entry"
    echo "4) Access keys"
    echo "5) Exit"
    echo "====================="

    read -p "Choose an option [1-5]: " choice

    case $choice in
        1) add_secret;;
	2) update_secret;;
	3) log_entry;;
	4) access_key;;
        5) 
            echo "Exiting... Goodbye!"
            break
            ;;
        *) 
            echo "Invalid option, please choose 1-5."
            ;;
    esac
done
