#!/bin/bash

# $1 auth token
# $2 partialkey

curl -b /home/paseri-vol/develop/radiko/auth/cookie.txt 'https://radiko.jp/v2/api/auth2_fms' \
	-XPOST \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Referer: http://radiko.jp/' \
	-H 'Pragma: no-cache' \
	-H 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15' \
	-H 'X-Radiko-Device: pc' \
	-H "X-Radiko-Authtoken: $1" \
	-H 'X-Radiko-App-Version: 4.0.0' \
	-H 'X-Radiko-User: test-stream' \
	-H "X-Radiko-Partialkey: $2" \
	-H 'X-Radiko-App: pc_ts'

