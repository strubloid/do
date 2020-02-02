#!/usr/bin/env bash

ROOT_FOLDER="$(dirname "$(readlink -f "$0")")"

source "$ROOT_FOLDER/vendor/variables.sh"
source "$ROOT_FOLDER/vendor/utils.sh"
source "$ROOT_FOLDER/vendor/print.sh"
source "$ROOT_FOLDER/actions/basic.sh"

buildMenuOptions(){

    printLine -x "************************************************************"
    printLine -n "****** Do - Do whatever is necessary! **********************"
    printLine -x "************************************************************"
    printLine -a 1 "magento 2"
    printLine -a "************************************************************"


    printf "Please enter a menu option and enter or ${MENU_OPTION_COLOR}x to exit ${MENU_RESTART_COLOR}"
    read opt
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
            buildMagento2Options;
            exit;
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

