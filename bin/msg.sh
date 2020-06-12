#!/bin/bash

# ref: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
# ref: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux


Red="\033[0;31m"
Green="\033[0;32m"
Yellow="\033[1;33m"
Blue='\033[0;34m'
TextReset="\033[0m"


my_echo="echo -e"

opt_prefix=""
opt_suffix=$TextReset


positional=()
while [[ $# -gt 0 ]]
do
case "$1" in
    --red)
        opt_prefix+=$Red
        shift
        ;;
    --green)
        opt_prefix+=$Green
        shift
        ;;
    --yellow)
        opt_prefix+=$Yellow
        shift
        ;;
    --blue)
        opt_prefix+=$Blue
        shift
        ;;
    *)
        positional+=("$1")
        shift
        ;;
esac
done
set -- "${positional[@]}" # restore positional parameters


$my_echo $opt_prefix$@$opt_suffix
