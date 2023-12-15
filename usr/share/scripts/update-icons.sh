#!/bin/bash

mods_dir="/usr/share/mods/"
applications_dir="/usr/share/applications/"

# Check if source and destination directories exist
if [ -d "$mods_dir" ] && [ -d "$applications_dir" ]; then
    # Loop through files in mods directory
    for file in "$mods_dir"*; do
        # Extract the filename without the path
        filename=$(basename "$file")
        # Check if the corresponding file exists in applications directory
        if [ -f "$applications_dir$filename" ]; then
            cp "$mods_dir$filename" "$applications_dir"
            echo "$filename updated successfully."
        else
            echo "File $filename does not exist in the applications directory. Skipping..."
        fi
    done
    echo "Icons updated successfully."
else
    echo "Source or destination directory does not exist."
fi

