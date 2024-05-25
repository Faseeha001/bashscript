#!/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Function to create user with specific permissions
create_user_with_permissions() {
    username="$1"
    password="$2"
    permissions="$3"
    
    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping..."
        return 1
    fi

    # Create user
    useradd -m "$username" -s /bin/bash

    # Set password
    echo "$username:$password" | chpasswd

    # Assign permissions
    echo "$username $permissions" >> /etc/sudoers.d/custom_permissions

    echo "User '$username' created with permissions: $permissions"
}

# Check if the number of arguments provided is correct
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <username> <password> <permissions>"
    exit 1
fi

create_user_with_permissions "$1" "$2" "$3"
