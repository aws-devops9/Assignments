#!/bin/bash
#

R="\e[31m" # Red Colour
G="\e[32m" # Green colour
Y="\e[33m" # Yellow colour
N="\e[0m" # No colour

SOURCE_DIR=""
DAYS="14" # by default we are hardcoding it, if user wants he can overwrite it while executing the script.
DESTINATION_DIR=""
ACTION=""

USAGE(){
    echo "USAGE:: $(basename $0) -s <source_dir> -a <action>  -t <days>"
    echo "options::"
    echo " -s, Specify the SOURCE_DIR (mandotary)"
    echo " -t, Specify the number of DAYS, ex: 10"
    echo " -a, Specify the ACTION, ex: Delete or Archine"
    echo " -d, Specify the DESTINATION_DIR when you choose Archive action (mandotory)."
    echo " -h, Display help and Exit"

}

while getopts ":s:t:a:d:h" opt; do
    case $opt in
        s) SOURCE_DIR="$OPTARG";;
        t) DAYS="$OPTARG";;
        a) ACTION="$OPTARG";;
        d) DESTINATION_DIR="$OPTARG";;
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :) USAGE; exit;;
        h) USAGE; exit;;
    esac
done

if [ ! -d $SOURCE_DIR ]
then
    echo -e "Source Directory $R..$SOURCE_DIR $R does not exist $N"
    exit 1
fi

if [ -z "$DESTINATION_DIR" ] || [ "$ACTION" == "archive" ] # -z means if nothing given for DESTINATION_DIR
then
    echo -e "$R ERROR $N: -d is mandotory when -a is archive"
    USAGE
    exit 1
fi 
if [ "$ACTION" == "delete" ]
then 
    FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +$DAYS -name "*.log")

 while IFS= read -r line # It will read the lines line by line # IFS is Internal Field Separator
 do
    echo "Deleting files: $line"
    rm -rf $line # It will delete the files line by line
 done <<< $FILES_TO_DELETE #We are giving Files_TO_DeELETE output as an input to while loop here
else
    FILES_TO_ARCHIVE=$(find $SOURCE_DIR -type f -mtime +$DAYS -name "*.log")

 while IFS= read -r line # It will read the lines line by line # IFS is Internal Field Separator
 do
    echo "Archiving files: $line"
    zip -r "$DESTINATION_DIR/$(basename "$line").zip" # It will archive the files line by line
 done <<< $FILES_TO_ARCHIVE
fi

