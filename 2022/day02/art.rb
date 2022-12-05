# Day 2: We had to play rock paper scissors for campsites
$stdin = open 'input.txt'

                 p;i=
               ->l,     q{l.index q\
             };+o         =t=0;$<.map{
           a,v7            ,x=_1.chars
   o+=(n=i[+y              ='XYZ',x])+
(+a    == x.     tr(       y,'CAB')?6:
a    ==   x.   tr(y,%\ABC   \)?3:0)+1;t  +=
n*3+1    +i   ['BCA'.chars    .rotate(-n)
    .   *(    ''),a]};puts"
    p1:#{     o} p2:#{t}#{}
               ".+@.strip
