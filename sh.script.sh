#!/bin/bash

for ((i=0; i<=100; i++)); do
    if [ $((i % 10)) -eq 0 ]; then
        case $i in
            0) wordy_version="zero";;
            10) wordy_version="ten";;
            20) wordy_version="twenty";;
            30) wordy_version="thirty";;
            40) wordy_version="forty";;
            50) wordy_version="fifty";;
            60) wordy_version="sixty";;
            70) wordy_version="seventy";;
            80) wordy_version="eighty";;
            90) wordy_version="ninety";;
            100) wordy_version="one hundred";;
        esac
        echo "$i: $wordy_version"
    else
        echo "$i"
    fi
done
