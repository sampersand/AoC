# Day 6 in perl.
open A,"day6.txt";$/="";chomp,$l+=()=(join"",sort split"")=~/(.)\1{@{[s|\n||g||0]}}/g for<A>;print$l
