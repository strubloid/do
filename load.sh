#!/usr/bin/env bash

## loading all variables
source vendor/variables.sh

## loading utils package
source vendor/utils.sh

## loading the bootstrap for this project
source vendor/bootstrap.sh

## loading sudor action
requiredSudoUser;

## checking if exists the binary
checkBinaryExists;

printf "foi\n"


