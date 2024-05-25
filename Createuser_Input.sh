#!/bin/bash

# Prompt for user details
read -p "Enter username: " username
read -s -p "Enter password: " password
echo
read -p "Enter full name: " full_name
read -p "Enter user's home directory (press Enter for default): " home_directory

# Default home directory if not provided
if [ -z "$home_directory" ]; then
    home_directory="/home/$username"
fi

# Create the user with specified details
sudo useradd -m -c "$full_name" -d "$home_directory" "$username"

# Set password for the user
echo "$username:$password" | sudo chpasswd

# Add the user to the sudo group for admin privileges
sudo usermod -aG sudo "$username"

echo "User $username created with full privileges."
