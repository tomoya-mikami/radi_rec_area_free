#!/bin/bash

AUTH_EXEC_P=$BIN_P/auth

# download myplayer-release
curl http://radiko.jp/apps/js/flash/myplayer-release.swf > $AUTH_EXEC_P/myplayer-release.swf

# get authkey.png
swfextract $AUTH_EXEC_P/myplayer-release.swf -b 12 -o $AUTH_EXEC_P/authkey.png

# get cookie
$AUTH_EXEC_P/cookie.sh $AUTH_EXEC_P

# auth1 get X-Radiko-AuthToken X-Radiko-KeyLength X-Radiko-KeyOffset
RES1=$($AUTH_EXEC_P/auth1.sh $AUTH_EXEC_P)

AUTH_TOKEN=$($AUTH_EXEC_P/parse-header.sh "$RES1" X-Radiko-AuthToken)
KEY_LENGTH=$($AUTH_EXEC_P/parse-header.sh "$RES1" X-Radiko-KeyLength)
KEY_OFF_SET=$($AUTH_EXEC_P/parse-header.sh "$RES1" X-Radiko-KeyOffset)

# get partical key from authkey.png
PARTICAL_KEY=`dd if=$AUTH_EXEC_P/authkey.png ibs=1 skip=$KEY_OFF_SET count=$KEY_LENGTH | base64`

# auth2
RESULT=$($AUTH_EXEC_P/auth2.sh $AUTH_TOKEN $PARTICAL_KEY)

echo "$AUTH_TOKEN"
