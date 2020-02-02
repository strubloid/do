#!/usr/bin/env bash

ROOT_FOLDER="$(dirname "$(readlink -f "$0")")"

source "$ROOT_FOLDER/actions/moma.sh"


buildMagento2Options(){

    printLine -x "************************************************************"
    printLine -n "****** Magento 2 **********************"
    printLine -x "************************************************************"
    printLine -a 1 "cache clean"
    printLine -a "************************************************************"

    printf "Please enter a menu option and enter or ${MENU_OPTION_COLOR}x to exit ${MENU_RESTART_COLOR}"
    read opt

    while [ $opt != '' ]
        do
        if [ $opt = '' ]; then
          exit;
        else
          case $opt in
            1) clear;
                moma-cache-clean;
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

}

