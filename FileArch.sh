#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <file_to_archive> <archive_name> <destination_directory>"
    exit 1
fi

# Assign input arguments to variables
file_to_archive=$1
archive_name=$2
destination_directory=$3

# Check if the file to archive exists
if [ ! -f "$file_to_archive" ]; then
    echo "Error: File '$file_to_archive' not found!"
    exit 1
fi

# Create the archive
tar -czf "$archive_name.tar.gz" "$file_to_archive"

# Check if the archive was created successfully
if [ $? -eq 0 ]; then
    echo "Archive created: $archive_name.tar.gz"
else
    echo "Error creating archive!"
    exit 1
fi

# Move the archive to the destination directory
mv "$archive_name.tar.gz" "$destination_directory/"

# Check if the move operation was successful
if [ $? -eq 0 ]; then
    echo "Archive moved to: $destination_directory"
else
    echo "Error moving archive to destination directory!"
    exit 1
fi

exit 0
