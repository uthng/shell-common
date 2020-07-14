#!/usr/bin/env bash

# Assert non empty with exit
# Params:
#   $1: value
#   $2: error msg
# Return
#   N/A
#
# Examples:
#   assert_not_empty "${base_datadir}" "base_datadir must not be empty"
#   Returns: N/A
function assert_not_empty {
    local readonly value="$1"
    local readonly msg="$2"

    if [[ -z "${value}" ]]; then
        log_error "${msg}"
        exit 1
    fi
}

# Assert error with messsage and exit
# Params:
#   $1: returned value
#   $2: message error
# Return
#   N/A
#
# Examples:
#   assert_error "$ret" "Message error"
#   Returns: N/A
function assert_error {
    local readonly ret=$1
    local readonly msg="$2"

    if [ ${ret} -ne 0 ]
    then
        if [ "${msg}" != "" ]
        then
            log_err "${msg}"
        fi
        exit 1
    fi
}
