#!/usr/bin/bash
 
 # This is a Simple guessing game Program.
 # It generates data regarding the date, wins and losses counts to a Data.txt file
 # The goal of the game is to guess between a random number from 0 - 9


# Assign data.txt file to a variable
 GAMEDATA="Gamedata.txt"

# Checks to see if data file exist and if not create new file
 if [[ ! -f "$GAMEDATA" ]]; then
    echo "$GAMEDATA does not exist, so file will be created."
    echo "Wins: 0" > "$GAMEDATA"
    echo "Losses: 0" >> "$GAMEDATA"
 fi


# Create a random number between 0 and 9 
randno=$((RANDOM % 10))

# output information to user
 echo "This is a guessing game called Guesser"
 echo "The objective of the game is to guess a number between 0 and 9."
 echo "Every player is given 2 tries Goodluck!"

# Player has 2 tries 
tries=2

# Get function from library script
LIB="./Library.sh"
if [[ -e $LIB ]]; then
    source "$LIB"
else
    echo "Library Not Found"
    exit 1
fi



while (( tries > 0)); do
    read -n 1 -p  "Enter a number between 0-9: " guess

    if  [[ $guess =~ ^[0-9]+$ ]]; then
        if (( guess == randno )); then
            echo -e "\nCorrect guess."
            updatedata "Win"
            break
        else
            echo -e "\nwrong guess keep at it. "
            echo "$randno"
            (( tries-- ))
            
            if (( tries > 0 )); then
                echo -e "\nYou have $tries tries left."
            else
                echo -e "\nToo bad you failed! The correct number was $randno."
                updatedata "Loss"
            fi
        fi
    else 
        echo -e "\nPlease enter a number between 0-9"
        
    fi
done




