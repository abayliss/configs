#!/bin/bash

for i in {0..255}; do
	printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i
    if ! (( ($i - 3) % 6 )); then
        echo
    fi
done
