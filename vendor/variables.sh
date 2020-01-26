#!/bin/bash

PROJECT_NAME="DO (anything on linux)"

## folders
HOME_FOLDER=$(echo $HOME)
CURRENT_FOLDER=$(pwd)
BINARY_SOURCE="$CURRENT_FOLDER/do.sh"


## Binary folder and file
BINARY_FOLDER='/usr/local/bin'
BINARY_FILE="$BINARY_FOLDER/doo"


## Colors
COLOR_RED='\e[1;31m%s\e[0m\n'
COLOR_GREEN='\e[1;32m%s\e[0m\n'
COLOR_YELLOW='\e[1;33m%s\e[0m\n'
COLOR_BLUE='\e[1;34m%s\e[0m\n'
COLOR_MAGENTA='\e[1;35m%s\e[0m\n'
COLOR_CYAN='\e[1;36m%s\e[0m\n'


MENU_LINE_COLOR="\033[36m"
MENU_NUMBER_COLOR="\033[36m"
MENU_MSG_COLOR="\033[01;31m"























EXPORTEDFILE='.bash_aliases_export.sh'
FILESTOREAD='files_to_read.txt'