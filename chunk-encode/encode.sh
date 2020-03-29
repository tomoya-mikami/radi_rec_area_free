#!/bin/bash

# $1 radio chunklist path
# $2 auth token

ffmpeg \
	-content_type 'application/x-www-form-urlencoded' \
	-headers 'Referer: http://radiko.jp/' \
	-headers 'Pragma: no-cache' \
	-headers "X-Radiko-AuthToken: $2" \
	-user_agent 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15' \
	-i "$1" \
	-vn -acodec copy -bsf aac_adtstoasc "$RADIKO_SAVE_PATH/$RADIKO_SAVE_FILE_NAME.m4a"
 
