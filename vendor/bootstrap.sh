#!/usr/bin/env bash
source vendor/variables.sh
source vendor/utils.sh

printMenuLine()
{
   printf "${MENU_LINE_COLOR}**${MENU_NUMBER_COLOR} $1)${MENU_LINE_COLOR} $2 ${MENU_RESTART_COLOR}\n"
}

printQuestion()
{
   printf "Please enter a menu option and enter or ${MENU_OPTION_COLOR}x to exit ${MENU_RESTART_COLOR}"

}

headeMenuLine()
{
    if [ -z "$1" ]
    then
        printf "\n${MENU_LINE_COLOR}*********************************************${MENU_RESTART_COLOR}"
    else
        printf "\n${MENU_LINE_COLOR}****** $1 *******${MENU_RESTART_COLOR}\n"
    fi


}

footerMenuLine()
{
    printf "${MENU_LINE_COLOR}*********************************************${MENU_RESTART_COLOR}\n"
}

printLine()
{

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
output_file=""
verbose=0
before=0
after=0

while getopts "s:e" opt; do
    case "$opt" in
    s) b=1  ;;
    e) a=1  ;;
    esac
done

echo "[B]$b"
echo "[A]$a"



shift $((OPTIND-1))

#[ "${1:-}" = "--" ] && shift

echo "[B]$before"
echo "[A]$after"
echo "Leftovers: $@"
 exit 1



OPTIND=1
    while [ -n "$1" ]; do

#        case "$1" in
#            *) PRINTTEXT=$1;;
#        esac
        printf "$1\n"
        shift
    done


#printf "[1] $PRINTTEXT\n"

printf "[2]\n\n"

    while [ -n "$1" ]; do

#        case "$1" in
#            *) PRINTTEXT=$1;;
#        esac
        printf "$1\n"
        shift
    done


#printf "[1] $PRINTTEXT\n"



exit 1

    while [ -n "$1" ]; do

        case "$1" in

        -s) printf "S?\n"
            PRINTTEXT="antes $PRINTTEXT" ;;

        -e) printf "E?\n"

            PRINTTEXT="$PRINTTEXT depois";;

        esac
        shift
    done

printf "[q] $PRINTTEXT\n"

exit 1

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.
#
#echo "-      $0       -"
#
#getopts s:e:b: option
#
#while
#do
#   echo $option
#done


#printf "FINALRESULT:     $1    \n"


exit 1


    PRINTTEXT=$1
    printf "$1\n"
#    getopts s:e:b options
#options="$@"

    printf "$options"
    exit 1
#    if  [[ $options = "s" ]]; then
#        PRINTTEXT="\n (A )$PRINTTEXT"
#    fi
#
#    if  [[ $options = "e" ]]; then
#        PRINTTEXT="$PRINTTEXT (D) \n"
#    fi
#
#
#    if  [[ $options = "b" ]]; then
#        PRINTTEXT="\n -- $PRINTTEXT -- \n"
#    fi

    ## printf "$PRINTTEXT"


#
#    if  [[ $n= "-e" ]]; then
#        echo "Option -o turned on"
#    fi
#
#    BASH_PREFIX_COLOR='\e['
#    BASH_CONNECTOR_COLOR='%b'
#    printf $BASH_PREFIX_COLOR $1 $BASH_CONNECTOR_COLOR $2
}
buildMenuOptions(){


#    printLine "*****"
    printLine -s -e '*****'

    exit  1;
    printLine -e "*****"
    printLine -b "*****"

    exit  1;
    headeMenuLine
    headeMenuLine "Do - Do whatever is necessary!"
    footerMenuLine

    printMenuLine 1 "test 1"
    printMenuLine 2 "test 2"
    footerMenuLine

    printQuestion
    read opt
}

pickedOption(){
    message=${@:-"${normal}Error: No message passed"}
    printf "${MENU_OPTION_BOLD_COLOR}${message}${MENU_RESTART_COLOR}\n"
}

#clear
buildMenuOptions

while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        1) clear;
            pickedOption "Option 1";
            printf "Action 1";
            buildMenuOptions;
        ;;
        2) clear;
            pickedOption "Option 2";
            printf "Action 2";
            buildMenuOptions;
        ;;

        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            pickedOption "Pick an option from the menu";
            buildMenuOptions;
        ;;
      esac
    fi
done