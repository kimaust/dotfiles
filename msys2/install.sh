#!/bin/bash

# Read the file and expand variables
while IFS= read -r line
do
    # Use eval to expand variables in each line
    expanded_line=$(eval echo "$line")
    # Append to a temporary array
    packages+=("$expanded_line")
done < essential-packages

# Join the array elements with spaces
package_list="${packages[*]}"

# Install packages
pacman -S $package_list

