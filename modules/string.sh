#!/usr/bin/env bash

# Remove leading spaces, trailing spaces and 
# multiple spaces between words of a string
# Params:
#   $1: string
# Return
#   string
#
# Examples:
#   str_remove_spaces " aa     bb   cc  "
#   Returns: "aa bb cc"
function str_remove_spaces {
    local -r str="$1"

    echo -e "${str}" | sed 's/^ *//g;s/  */ /g;s/ *$//g'
}
