#!/bin/dash
[ $# = 0 ] && set ./sample.txt

tobinary () { bc <<EOS; }
obase=2
$*
EOS

exec < "$1"
while read input
do
	rest=${input#*:}
	head=${input%":$rest"}

	iter=0
	set $rest
	q=`echo $rest | sed 's/ / X /g'`
	max=$(( 1 << $(expr $# - 1) ))
	while test $iter -lt $max
	do
		echo $iter
		iter=`expr $iter + 1`
	done

	p $(( 10 & 3 ))
	exit
	p "$@" : "$head"
	exit
done

