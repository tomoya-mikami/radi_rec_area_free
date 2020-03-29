#!/bin/bash

RES='#EXTM3U #EXT-X-VERSION:3 #EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=52973,CODECS="mp4a.40.5" https://radiko.jp/v2/api/ts/chunklist/onhLhbx5.m3u8'

LIST_LINE=`cat res.txt | grep -o 'https.*'`
echo $LIST_LINE | sed -e 's/.*\(https.*\)/\1/'

