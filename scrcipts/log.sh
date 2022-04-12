#!/usr/bin/env bash

# Reset the log files
printf '' > info-log.txt > debug-log.txt

# Tail the info logfile as a background process so the contents of the
# info logfile are output to stdout.
tail -f info-log.txt &

# Set an EXIT trap to ensure your background process is
# cleaned-up when the script exits
trap "pkill -P $$" EXIT

# Redirect both stdout and stderr to write to the debug logfile
exec 1>>debug-log.txt 2>>debug-log.txt

# Write to both info and debug
echo "Making an HTTP request to Google" | tee -a info-log.txt

# Write to info only. Remember to always append
echo "Sorry, this might take some time." >> info-log.txt

# This command is only present to indicate failure or success.
# If it fails the program will exit, if it succeeds it will just keep going.
# I only want to see its output when there is a failure.
curl -v -f https://Betika.com

# Written to both info and debug
echo " ✅ " | tee -a info-log.txt
