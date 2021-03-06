#!/bin/bash
FILES=*-mod
for FILE in $FILES; do
	gnuplot <<- EOF
		set terminal png
		set tics font "Helvetica,10"
		set ylabel "Mbit/s"
		set xlabel "s"
		set output "plots/${FILE}.png"
		plot "${FILE}" title "${FILE}" with linespoints
EOF
done
