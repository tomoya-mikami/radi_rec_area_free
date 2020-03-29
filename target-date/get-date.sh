#!/bin/bash

# $1 Day of week Sun | Mon | Tue | Wed, | Thu | Fri | Sat

DAY_CODE=-1

case $1 in
	"Sun" ) DAY_CODE=0 ;;
	"Mon" ) DAY_CODE=1 ;;
	"Tue" ) DAY_CODE=2 ;;
	"Wed" ) DAY_CODE=3 ;;
	"Thu" ) DAY_CODE=4 ;;
	"Fri" ) DAY_CODE=5 ;;
	"Sat" ) DAY_CODE=6 ;;
esac

if [ $DAY_CODE -lt 0 ] ; then
	echo "[ERROR] not found DAY_CODE $1"
	exit 1
fi

TARGET_DATE=-1
for i in `seq 1 7`
do
	DATE_FORMAT="$i days ago"
	CHECK_DAY_CODE=`date "+%w" -d "$DATE_FORMAT"`
	if [ $CHECK_DAY_CODE = $DAY_CODE ] ; then
		TARGET_DATE=`date "+%Y%m%d" -d "$DATE_FORMAT"`
		break
	fi
done


if [ $TARGET_DATE -lt 0 ] ; then
	echo "[ERROR] not found TARGET_DATE $1"
	exit 1
fi

echo $TARGET_DATE

