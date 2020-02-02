#!/usr/bin/env bash

ROOT_FOLDER="$(dirname "$(readlink -f "$0")")"

## loading all variables
source "$ROOT_FOLDER/vendor/variables.sh"

## loading utils package
source "$ROOT_FOLDER/vendor/utils.sh"

## loading sudor action
requiredSudoUser;

## checking if exists the binary
checkBinaryExists;

printf "Finished\n"


