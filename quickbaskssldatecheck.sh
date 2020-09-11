#!/bin/bash

function check {
	echo QUIT | openssl s_client -connect "$1" 2>/dev/null | openssl x509 -noout -subject -dates | sed -e 's/^/"/' -e 's/$/"/' | tr -s '\n' ';'
	echo
}

while read -r line; do check $line ; done < $1

