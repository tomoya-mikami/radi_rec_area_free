#!/bin/bash

# $1 response header
# $2 target key

FIX=`echo "$1" | sed -e 's/X-RADIKO-AUTHTOKEN/X-Radiko-AuthToken/'`
TOKEN_LINE=`echo "$FIX" | grep -o ".*${2}.*"`
AUTH_TOKEN=`echo "$TOKEN_LINE" | sed -e "s/$2=\(.*\)/\1/"`
echo $AUTH_TOKEN

