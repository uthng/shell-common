#!/usr/bin/env bash

# Print log message with level and corresponding color
# Params:
#   $1: level
#   $2: message
# Return
#   string log message with date, level, program and color
#
# Examples:
#   log "INFO" "This is INFO level"
#   Returns: N/A
function log {
    local readonly level="$1"
    local readonly message="$2"
    local readonly timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    local color=""
    local reset_color="$(tput sgr0)"

    if [[ "${level}" == "INFO" ]]; then
        color="$(tput setaf 2)"
    elif [[ "${level}" == "WARN" ]]; then
        color="$(tput setaf 3)"
    elif [[ "${level}" == "ERROR" ]]; then
        color="$(tput setaf 1)"
    fi

    >&2 echo -e "${color}${timestamp} [${level}] [$SCRIPT_NAME] ${message}${reset_color}"
}

# Print INFO log message
# Params:
#   $1: message
# Return
#   string log message with level INFO
#
# Examples:
#   log_info This is INFO level"
#   Returns: N/A
function log_info {
    local readonly message="$1"
    log "INFO" "$message"
}

# Print WARN log message
# Params:
#   $1: message
# Return
#   string log message with level WARN
#
# Examples:
#   log_warn This is WARN level"
#   Returns: N/A
function log_warn {
    local readonly message="$1"
    log "WARN" "$message"
}

# Print ERROR log message
# Params:
#   $1: message
# Return
#   string log message with level ERROR
#
# Examples:
#   log_error This is ERROR level"
#   Returns: N/A
function log_error {
    local readonly message="$1"
    log "ERROR" "$message"
}

