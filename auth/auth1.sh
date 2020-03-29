#!/bin/bash

curl -b $1/cookie.txt 'https://radiko.jp/v2/api/auth1_fms' \
	-XPOST \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Referer: http://radiko.jp/' \
	-H 'Pragma: no-cache' \
	-H 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15' \
	-H 'X-Radiko-Device: pc' \
	-H 'X-Radiko-App-Version: 4.0.0' \
	-H 'X-Radiko-User: test-stream' \
	-H 'X-Radiko-App: pc_ts' \
	--data $'\r\n'

