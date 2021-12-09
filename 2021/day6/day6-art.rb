# Day 6; we had to count lantern fish.
$stdin = open('day6.txt') # omit if reading from stdin

             I=\
$<           .gets
 .tr(       ",",' ').split.map(&
  :to_i);S=->t{m=I.tally;t.times{m.
  transform_keys!{_1-1};;m[6]+=e=m.
  delete(-1)||0;m[8]=e};m.sum{_1[~
 0]}};    p [S[      80],S[2\
**8     ]];
