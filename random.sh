#!/bin/bash
#
# Generate a random 12 character alphanumeric string (upper
# and lowercase) special characters and numbers.


random-string() {

cat /dev/urandom | tr -dc '(\&\_a-zA-Z0-9\^\*\@\%' | fold -w ${1:-12} | head -n 1

}

