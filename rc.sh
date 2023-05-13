# @description: This file help to manage your rc folder
# @usage:
# Load this file in your .bashrc or .zshrc file
# Example:
#  source ~/.rc/rc.sh
#
# Then you can use rc-* functions in your shell
# Example:
#   rc-edit profile
#   rc-load profile
#   rc-load modules/foo
#
# @author: MaDnh
# @git: https://github.com/madnh/dot-rc
# @license: MIT



# Path to home of your .rc folder
export RC_HOME=${RC_HOME:-"$HOME/.rc"}

# Return subpath of files/folders in RC_HOME directory
function rc-path(){
    local _TARGET_SUB_PATH=$1

    echo "$RC_HOME/$_TARGET_SUB_PATH"
}

# Print message that path not exists
function rc-error-path-non-exists(){
    local _ERROR_PATH=$1

    echo "[RC ERROR] Path not found: $_ERROR_PATH"
}

# Correctly the input file with extension
# Input:
#  1. Filename, with or without extension. Example: profile, profile.sh, modules/foo, modules/foo.sh
#
# Extension priority:
#   - input file
#   - input file + .sh
#   - input file + .zsh
function rc-correct-file(){
    local _TARGET_FILE="$1"
    local _TARGET_BASE_PATH=`rc-path "$_TARGET_FILE"`


    if [ -e "$_TARGET_BASE_PATH" ]; then
        echo "$_TARGET_BASE_PATH"
    elif [ -e "${_TARGET_BASE_PATH}.sh" ]; then
        echo "${_TARGET_BASE_PATH}.sh"
    elif [ -e "${_TARGET_BASE_PATH}.zsh" ]; then
        echo "${_TARGET_BASE_PATH}.zsh"
    fi
}

# Edit a file in RC_HOME directory, with $EDITOR
# Input:
#  1. Full filename (with extension) or just filename
function rc-edit(){
    local _EDITOR="${EDITOR:-vim}"
    local _TARGET_FILE="${1:-profile.sh}"
    local _TARGET_PATH=`rc-correct-file "$_TARGET_FILE"`

    if [ -z "$_TARGET_PATH" ]; then
        _TARGET_PATH=`rc-path "$_TARGET_FILE"`
    fi

    $_EDITOR "$_TARGET_PATH"
}

# Load a file in RC_HOME directory
# Input:
#   1. Full filename (with extension) or just filename
# Example:
#  rc-load profile
#  rc-load profile.sh
#  rc-load modules/foo
#  rc-load modules/foo.sh
function rc-load(){
    local _TARGET_FILE=$1
    local _TARGET_PATH=`rc-correct-file "$_TARGET_FILE"`


    if [ -z "$_TARGET_PATH" ]; then
        rc-error-path-non-exists $_TARGET_FILE
        return 1
    fi

    source "$_TARGET_PATH"
}
