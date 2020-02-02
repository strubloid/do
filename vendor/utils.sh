#!/usr/bin/env bash

ROOT_FOLDER="$(dirname "$(readlink -f "$0")")"

## loading all variables
source "$ROOT_FOLDER/vendor/variables.sh"

## Method that will check if you are a sudor user or not
areYouSudoUser()
{
    local prompt
    prompt=$(sudo -nv 2>&1)

    if [ $? -eq 0 ]; then
        echo 1
    elif echo $prompt | grep -q '^sudo:'; then
        echo 0
    else
        echo 1
    fi
}

## Checking if is it necessary to have sudor password for this action
requiredSudoUser()
{
    ## This will check if you need to provide the sudo password
    sudoUser=$(areYouSudoUser)
    if [[ $sudoUser == 1 ]]; then
        return 1
    fi


    ## starting the first screen of add your sudo user password
    if [ "$(id -nu)" != "root" ]; then
        sudo -k
        pass=$(whiptail --backtitle "$PROJECT_NAME Installer" \
                        --title "Authentication is required :)" \
                        --passwordbox "Installing $PROJECT_NAME requires administrative privilege. \n\n[sudo] Password for user $USER:" 12 60 3>&2 2>&1 1>&3-)

        exitstatus=$?

        ## This will check if was canceled the action or not
        if [ $exitstatus = 0 ]; then

            ## This will run the actual command
            exec sudo -S -p '' "$0" "$@" <<< "$pass"

        else
            ## This will show that you pressed the cancel action
            whiptail --title "Cancel" --msgbox "Operation Cancel" 10 60
        fi

    fi

}

## Checking if a file exists
checkFileExists()
{
    if [[ -f  $1 ]]; then
        return 1
    else
        return 0
    fi
}

## Checking if a binary exists
checkBinaryExists()
{

    printf "[1]: Check for the $BINARY_FILE\n";

    WHEREIS=$(whereis doo)

    if [ "$WHEREIS" == "doo:" ]; then

        printf "[1]\t[Missing]: missing do file, so we will be generating a new one on $BINARY_FILE\n"
        printf "[1]\t[Action]: Creating Soft Link: $BINARY_SOURCE $BINARY_FILE"

        chmod +x do.sh
        sudo ln -s "$BINARY_SOURCE" "$BINARY_FILE"
        chmod 777 "$BINARY_FILE"

    else
        printf "[1]: Exists\n"
    fi

}

## Debug variables
listAllArguments()
{
    total=1

    for var in "$@"; do

        echo "\$@ =======> #$total = $var"

        total=$(($total + 1))

    done
}