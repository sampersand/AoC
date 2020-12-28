# Day 15 in perl.
# We had some elves play a memory game with us.

open STDIN,'day15.txt'; # omit this if reading from stdin

$/=',';chop   ,$M          {$_}=[$.,$.
]while<>;$x   =$M          {$l=$M{$l}[
0]+           -$M          {$l
}[+           1]}          ||=
[$.,$.]       ,($          .==2020
and$o=$       l),          unshift
($x           ,$.          ),!
pop           $x,          "S"
until$.++==   30000000;"   &";
print"P1: $   o\nP2: $l\   \n"
