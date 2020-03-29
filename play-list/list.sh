#!/bin/bash

COOKIE_P=$BIN_P/auth/

# $1 station_id
# $2 from yyyymmddhhmmss
# $3 to yyyymmddhhmmss
# $4 auth_token

RES=`curl -b $COOKIE_P/cookie.txt "https://radiko.jp/v2/api/ts/playlist.m3u8?station_id=$1&l=15&ft=$2&to=$3" \
	-XPOST \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Referer: http://radiko.jp/' \
	-H 'Pragma: no-cache' \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15' \
	-H "X-Radiko-Authtoken: $4" \
	--data 'flash=1'`

LIST_LINE=`echo "$RES" | grep -o 'https.*'`
echo $LIST_LINE | sed -e 's/.*\(https.*\)/\1/'
