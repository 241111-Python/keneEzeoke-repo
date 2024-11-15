#!/usr/bin/bash

# This is my Analyzer.
# When run, it performs an analysis of the Data.txt file.

GAMEDATA="/mnt/c/Revature/keneE/guesser/Gamedata.txt"
STATISTICS="/mnt/c/Revature/keneE/guesser/Statistics.txt"

# Checks to see if data file exist and if not create new file
 if [[ ! -f "$STATISTICS" ]]; then
    echo "$STATISTICS does not exist, so file will be created."
    touch "$STATISTICS"
 fi

LIB="/mnt/c/Revature/keneE/guesser/Library.sh"
if [[ -e $LIB ]]; then
    source "$LIB"
else
    echo "Library Not Found"
    exit 1
fi


# Use grep to get wins from data file the pipe through awk to get 2nd column which is the value
wins=$(grep "Wins:" "$GAMEDATA" | awk '{print $2}')

# Use grep to get losses from data file the pipe through awk to get 2nd column which is the value
losses=$(grep "Losses:" "$GAMEDATA" | awk '{print $2}')

total=$(sum "$wins" "$losses")
compare $wins $losses $total


    