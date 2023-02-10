#!/bin/bash

# The goal of this script is to count the number of lines in a series of files. Each line count should be printed one at a time

# Part 1: Read the file names as a list
# Google the difference between "$@" and "$*", i.e. the difference between `@` and `*`. These are both magic variables that read all the arguments given to function or script.

# NOTE: `declare` lets you set the type of a variable. We're using `-a` here to indicate this is an array, instead of the default type of string.
declare -a file_names=("$...")

for file in "${file_names[@]}"; do

    # Part 2: Check if the file exists
    # HINT: [[ is also known as test and [

    if [[ "..." "..." ]]; then
        # Part 3: Print the number of lines using wc. wc prints the number of words, characters, and lines, but we only want lines.
        # HINT: What flags and arguments do we need to pass to wc to change its behavior?
        wc ... ...
    else
        echo "File does not exist."
    fi
done
