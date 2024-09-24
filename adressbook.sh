!/bin/bash

FILE="addressbook.txt"

add_contact() {
    echo "Name:"
    read name
    echo "Phone:"
    read phone
    echo "Email:"
    read email

    echo "$name, $phone, $email" >> $FILE
    echo "Contact added successfully!"
}

search_contact() {
    echo "Enter search term (name, phone number, or email):"
    read search_term
    echo "Searching..."
    grep -i "$search_term" $FILE

    if [ $? -ne 0 ]; then
        echo "No matching contact found."
    fi
}

remove_contact() {
    echo "Enter name, phone number, or email of the contact to remove:"
    read remove

    grep -i -v "$remove" $FILE > temp.txt
    mv temp.txt $FILE

    echo "Contact removed if it existed."
}

case $1 in
    add)
        add_contact
        ;;
    search)
        search_contact
        ;;
    remove)
        remove_contact
        ;;
    *)
        echo "Usage: $0 add|search|remove to execute the script. It has params such as name|phone|email."
        ;;
esac