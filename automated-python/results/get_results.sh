#!/bin/bash
FILES=../client/iperf/*
for f in $FILES
do
	filename=$(basename $f)
	cat $f | grep sec | head -$(cat $f | wc -l) | tr - " " | awk '{print $4,$8}' > $filename
	#bash continous_time.sh $filename
	#echo "This is file $f"
done
