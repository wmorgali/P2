#!/bin/bash

# Define the alias in the current shell
alias file_remove='function _file_remove() { 
    if [ -d "$1" ]; then 
        rm -v "$1"/*.bin
        echo "Files removed from $1."
    else 
        echo "Error: Directory $1 does not exist."
    fi
}; _file_remove'

# Notify the user
echo "Alias 'file_remove' has been created. Usage: file_remove <target_directory>"
