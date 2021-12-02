# Day 2: We're still in a submarine,
# so let's draw a fishie.

$stdin=open('day2.txt')
a=h=m=n=0
$<.map{|l|l=~/. /;p$_
x=$'.to_i
$&=~/n|p/?(a+=x*=$&==?n?1:-1;m+=x):(h+=x;n+=a*x)}
p m*h;p n*h
