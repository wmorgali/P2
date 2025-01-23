#!/bin/bash

#Check if the even and odd directories exist
if [ ! -d "even" ]; then
    #Create the even directory
    mkdir even
fi
if [ ! -d "odd" ]; then
    #Create the odd directory
    mkdir odd
fi

for file in *; do
    #Skips any directories in the current directory
    if [ -d "$file" ]; then
        continue
    fi

    #Extract the index from the filename
    #This looks for a string of numbers 0-9 between the words _index_ and . in the filename
    if [[ $file =~ _index_([0-9]+)\. ]]; then
        #Stores the index found
        index=${BASH_REMATCH[1]}
        #Checks if the index is even or odd
        if ((index % 2 == 0 )); then
            #Move the file to the even directory
            mv $file even
        else
            #Move the file to the odd directory
            mv $file odd
        fi
    fi
done

#Tells user operation has been completed
echo "Files have been sorted into even and odd directories."