#!/usr/bin/env bash
ROOT_FOLDER="$(dirname "$(readlink -f "$0")")"

## loading all variables
source "$ROOT_FOLDER/vendor/variables.sh"

pickedOption(){
    message=${@:-"${MENU_RESTART_COLOR}Error: No message passed"}
    printf "${MENU_OPTION_BOLD_COLOR}${message}${MENU_RESTART_COLOR}\n"
}

menuLine(){

#    printf "(1) --- $LINENUMBER\n"
#    printf "(2) --- $LINETEXT\n"

    if [ -n "$LINENUMBER" ]; then
        echo "${MENU_LINE_COLOR}---> ${MENU_NUMBER_COLOR} $LINENUMBER)${MENU_LINE_COLOR} $LINETEXT${MENU_RESTART_COLOR}"
    else
        echo "${MENU_LINE_COLOR}$LINETEXT${MENU_RESTART_COLOR}"
    fi
}

printLine(){
    OPTIND=1         # Reset in case getopts has been used previously in the shell.

    BEFORE=false
    AFTER=false
    while getopts "b:a:x:n" opt; do
        case "$opt" in
        b) shift
            BEFORE=true
            ;;
        a) shift
            AFTER=true
            ;;
        n) shift
            BEFORE=false
            AFTER=false
            ;;
        x) shift
            BEFORE=true
            AFTER=true
            ;;
        esac
    done

#    printf "1 --- $1\n"
#    printf "2 --- $2\n"


    if [ -n "$2" ]; then
        LINENUMBER=$1
        LINETEXT=$2
    else
        LINETEXT=$1
    fi

    MENULINE=$(menuLine)

    if [[ "$BEFORE" == true ]]; then
        if [[ "$AFTER" == true ]]; then
            printf "\n$MENULINE\n"
        else
            printf "\n$MENULINE"
        fi

    else
        if [[ "$AFTER" == true ]]; then
            printf "$MENULINE\n"
        else
            printf "$MENULINE"
        fi
    fi

    unset LINENUMBER
    unset LINETEXT
}
