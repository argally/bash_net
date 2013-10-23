#!/bin/sh
#: ${1?"Usage: $0 ip subnet to scan. eg '10.171.13.'"}
#subnet=$1
LIST=`cat $1`
SHA="$2"
AUTH="$3"
for addr in $LIST; do
   ( echo $addr)
    if [ $addr == "10.171.7.241" ] || [ $addr == "10.171.7.242" ]
    then
      (snmpwalk -v3 -u nagios -l authPriv -a SHA -A $SHA -x DES -X $AUTH $subnet$addr sysuptime )
    else
      (snmpwalk -v3 -u nagios -l authPriv -a SHA -A $SHA -x AES -X $AUTH $subnet$addr sysuptime )
    fi
done
