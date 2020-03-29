#!/bin/bash

# $1 login id
# $2 login password
# $3 save directory path
# $4 save file name. auto set $4-YYYYMMDD as file name
# $5 station_id reference ./station_list.csv
# $6 Day of week Sun | Mon | Tue | Wed, | Thu | Fri | Sat
# $7 start time HHiiss
# $8 end time HHiiss

export BIN_P=/home/paseri-vol/develop/radiko
export RADIKO_LOGIN_ID=$1
export RADIKO_LOGIN_PASS=$2
export RADIKO_SAVE_PATH=$3

# set target date
TARGET_DATE=$($BIN_P/target-date/get-date.sh $6)
FROM="${TARGET_DATE}${7}"
TO="${TARGET_DATE}${8}"
STATION_ID=$5
export RADIKO_SAVE_FILE_NAME="${4}-${TARGET_DATE}"

# auth
AUTH_TOKEN=$($BIN_P/auth/radiko-auth.sh)

# get radio chunk path
CHUNK_LIST=$($BIN_P/play-list/list.sh $STATION_ID $FROM $TO $AUTH_TOKEN)

# encode m4a
$BIN_P/chunk-encode/encode.sh $CHUNK_LIST $AUTH_TOKEN

