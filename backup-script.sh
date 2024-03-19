#!/bin/bash

# Develop a backup script that takes a source directory and a destination directory as input and creates a compressed archive (.tar.gz) of the source directory in the destination folder with a timestamp.

R="\e[31m" # Red Colour
G="\e[32m" # Green colour
Y="\e[33m" # Yellow colour
N="\e[0m" # No colour

echo "Please enter Source and Destination to save the files"

echo "Please enter SOURCE_DIRECTORY"
read SOURCE_DIRECTORY

if [ ! -d $SOURCE_DIRECTORY ]
then
    echo "R ERROR..$NInvalid $SOURCE_DIRECTORY."
    exit 1
else
    echo "$SOURCE_DIRECTORY is Valid"
fi

echo "Please enter DESTINATION_DIRECTORY"
read DESTINATION_DIRECTORY

if [ ! -d $DESTINATION_DIRECTORY ]
then
    echo "$R ERROR..$N Invalid $DESTINATION_DIRECTORY."
    exit 1
else
    echo "$DESTINATION_DIRECTORY is Valid"
fi