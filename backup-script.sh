#!/bin/bash

# Develop a backup script that takes a source directory and a destination directory as input and creates a compressed archive (.tar.gz) of the source directory in the destination folder with a timestamp.

R="\e[31m" # Red Colour
G="\e[32m" # Green colour
Y="\e[33m" # Yellow colour
N="\e[0m" # No colour

echo "Please enter Source and Destination to save the files"

echo "Please enter Source_Directory"
read SOURCE_DIRECTORY

echo "Please enter Destination Directory"
read DESTINATION_DIRECTORY

