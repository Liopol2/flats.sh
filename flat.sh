#!/bin/bash

# Loop through each line in the file
while read -r line; do

  IFS=' ' read -ra command <<< "$line"

  # Count word position
  i=1
  for word in "${command[@]}"; do
    if [ $i -eq 3 ]; then
      break
    fi
    ((i++))
  done

  # Change the command to auto-confirm
  self_confirming_command="${command[@]:0:2} -y ${command[@]:2:3}"
  #echo "New command: $self_confirming_command"

  app="${command[@]:3}"
  # Output the app name
  echo "Installing $app"

  # Run the command from the line
  eval "$self_confirming_command"
done < flatpacks.txt
