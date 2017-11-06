#!/bin/bash

<<'COMMENT'
MPTCP performance test
created by:
Grzegorz Przybylo
University of Science and Technology in Cracow
Faculty of Computer Science, Electronics and Telecomunications
ICT
COMMENT

CLIENT_FOLDER=client2
FILES=../$CLIENT_FOLDER/client_*
for FILE in $FILES; do
	sed -i '/mptcp/d' $FILE
	filename=$(basename $FILE)
	gnuplot <<- EOF
		set terminal png
		set tics font "Helvetica,10"
		set ylabel "Mbit/s"
		set xlabel "s"
		set output "plots/${CLIENT_FOLDER}/${filename}.png"
		plot "${FILE}" title "${FILE}" with linespoints
EOF
done