#!/usr/bin/env bash

# Check if an item is in the array
# Params:
#   $1: item
#   $2: array
# Return
#   index of element if found, -1 otherwise
#
# Examples:
#   array_contains "B" ("A", "B", "C")
#   Returns: "1"
function array_contains {
    local -r item="$1"
    shift
    local -ra arr=("$@")

    local nb=${#arr[@]}

    for (( i=0; i<${nb}; i++ )); do
        if [[ "${item}" == "${arr[$i]}" ]]; then
            echo "$i"
            return
        fi
    done

    echo "-1"
}

# Split a string to an array
# Params:
#   $1: separator
#   $2: string
# Return
#   an array
#
# Examples:
#   array_split "," "A,B,C"
#   Returns: ("A" "B" "C")
function array_split {
    local -r separator="$1"
    local -r str="$2"
    local -a arr=()

    #IFS="$separator" read -a arr <<<"$str"
    arr=($(echo "${str}" | tr "${separator}" "\n"))

    echo ${arr[*]}
}

# Join elements of an array with given separator
# Params:
#   $1: separator
#   $2: array
# Return
#   string
#
# Examples:
#   array_join "," ("A" "B" "C")
#   Returns: A,B,C
function array_join {
    local -r separator="$1"
    shift
    local -r arr_str="$@"

    echo "${arr_str// /${separator}}"
}
