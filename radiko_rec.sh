#!/bin/bash

export BIN_P=/home/paseri-vol/develop/radiko
export RADIKO_LOGIN_ID=$1
export RADIKO_LOGIN_PASS=$2
export RADIKO_SAVE_PATH=$3
export RADIKO_SAVE_FILE_NAME=$4

# auth
AUTH_TOKEN=$($BIN_P/auth/radiko-auth.sh)

# get radio chunk path
CHUNK_LIST=$($BIN_P/play-list/list.sh FM-FUJI 20200322083000 20200322090000 $AUTH_TOKEN)

# encode mp3
$BIN_P/chunk-encode/encode.sh $CHUNK_LIST $AUTH_TOKEN

