#!/bin/zsh
# Script to download all example codes from go by example

# downloading main file
main_link="https://gobyexample.com/"
echo "Finding links..."
curl $main_link -s>main_link.txt

echo "Creating required directories.."
# clear folder if files already exists or create new folder
[ -d "./go_examples" ] && rm -rf go_examples
mkdir go_examples
[ -d "./temp" ] && rm -rf temp
mkdir temp

rc=$(recode --version)
sta=$(echo $?)
if [ $sta -ne 0 ]; then
    echo "This script relies on `recode`. Please install recode and try again."
    exit
fi

links=($(grep -o -P '(?<=li><a href=").*(?=">)' main_link.txt))

for link in $links; do
    file_url=$(curl $main_link$link -s | grep -oP '(http://play.golang.org).*(?=">)')
    echo "Downloading "$link".go"
    curl $file_url -s | sed -n '/package main/,/\/textarea>/p' | sed 's/<\/textarea>//' | recode html..ascii> "./go_examples/"$link".go"
done

echo "Cleaning files..."
rm main_link.txt
rm -rf temp

echo "Download Completed."