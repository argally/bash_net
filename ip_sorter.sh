#!/bin/sh
[ $# -eq 0 ] && { echo "Usage: $0 filename ip_pattern"; exit 1; }
cat $1 | grep $2 | awk '{print $5}' | sed s'/\/24/ /g' | sort -t . -k 3,3n -k 4,4n 
