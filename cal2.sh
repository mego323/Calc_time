#!/bin/bash

# Function to calculate the time difference and display in green
calculate_time_difference() {
    start_time=$1
    end_time=$2

    # Calculate time difference in seconds
    time_diff=$((end_time - start_time))

    # Convert time difference to hours and minutes
    hours=$((time_diff / 3600))
    minutes=$(( (time_diff % 3600) / 60 ))

    # Display the time difference in green
    echo ""
    echo -e "\e[32mTime Spent: ${hours} hours and ${minutes} minutes\e[0m"
    echo ""
}

# Main function
main() {
    echo "Welcome to the Gaming Hall!"
    echo ""
    # Prompt user for start time
    read -p "Enter start time (HH:MM format): " start_input
    echo ""
    # Extract hours and minutes from start time input
    start_hour=$(echo "$start_input" | cut -d: -f1)
    start_minute=$(echo "$start_input" | cut -d: -f2)

    # Convert start time to seconds since midnight
    start_time=$((start_hour * 3600 + start_minute * 60))

    # Prompt user for end time
    read -p "Enter end time (HH:MM format): " end_input
    echo ""
    # Extract hours and minutes from end time input
    end_hour=$(echo "$end_input" | cut -d: -f1)
    end_minute=$(echo "$end_input" | cut -d: -f2)

    # Convert end time to seconds since midnight
    end_time=$((end_hour * 3600 + end_minute * 60))

    # Calculate and display the time difference
    calculate_time_difference $start_time $end_time
    main
}

# Call the main function
main
