#!/usr/bin/bash
updatedata() {
    local value=$1  
    local date=$(date "+%Y-%m-%d %H:%M:%S")
    # Use grep to get wins from data file the pipe through awk to get 2nd column which is the value
    local wins=$(grep "Wins:" "$GAMEDATA" | awk '{print $2}')
    # Use grep to get losses from data file the pipe through awk to get 2nd column which is the value
    local losses=$(grep "Losses:" "$GAMEDATA" | awk '{print $2}')

    if [[ "$value" == "Win" ]]; then
        # Increase wins by 1
        ((wins++))
      
    else
        # Decrease losses by 1
        ((losses++))
        
    fi

    # Rewrite with updated data
    echo "Wins: $wins" > "$GAMEDATA"
    echo "Losses: $losses" >> "$GAMEDATA"
    # Add date and time of win or loss
    echo "$date - $value" >> "$GAMEDATA"
}

sum() {
    echo $(($1+$2))     
}

compare() {
    local wins=$1
    local losses=$2
    local gamesplayed=$3
    local date=$(date "+%Y-%m-%d %H:%M:%S")
   
    if [[ $wins -gt $losses ]]; then
        echo "Total games played: $gamesplayed" >> "$STATISTICS"
        echo "There are more wins: $wins than losses: $losses" >> "$STATISTICS"
        echo "Time: $date " >> "$STATISTICS"
    elif [[ $losses -gt $wins ]]; then
        echo "Total games played: $gamesplayed" >> "$STATISTICS"
        echo "There are more losses: $losses than wins: $wins" >> "$STATISTICS"
        echo "Time: $date " >> "$STATISTICS"
    else
        echo "Total games played: $gamesplayed" >> "$STATISTICS"
        echo "The wins: $wins are equal to the losses: $losses" >> "$STATISTICS"
        echo "Time: $date " >> "$STATISTICS"
    fi
}

