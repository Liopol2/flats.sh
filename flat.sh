#!/bin/bash

# Loop through each line in the file
while read -r line; do
  # Extract the last part of the line after the second . character
  app=$(echo "$line" | awk -F'[.]' '{print $(NF)}')

  # Output the app name
  echo "Installing $app"

  # Run the command from the line
  eval "$line"
done < flatpacks.txt
