#!/bin/bash

# This script should print out the remainder of one integer when it is divided by another

# Along the way you'll learn a little about interactive programs and math in bash

# Part 1.1: Use `read` to display the prompt "Enter a number: " and save it to the variable `number
number

# Part 1.2: Use `read` to display the prompt "Enter the modulus: " and save it to the variable `modulus`
modulus

# Part 2: Do the computation. Normally, the expression below would be a string. You need to figure out how to enter "math mode" in bash
remainder=number%modulus

# Part 3: Print the remainder "Your remainder is ..." using string interpolation (this is when you subsitute/use variables inside a string)

echo "Your remainder is ..."
