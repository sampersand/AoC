# Day 3: We had to calculate delta times epsilon.
$stdin=open('day3.txt') # omit if reading from stdin

R=->{;s=_3.t[_2].tally.values_at(?0,+?1).reduce(
_1                                            )?
?0  :?1;_3.select{|          x|x[_2]==s}};e=  d=
f=  $<.map{_1.chomp          .chars};(0..d.s  ).
%(  1){;                     d[1]             &&
d=  R[:>                     ,_1,             d]
e[  1]&&                     e=R[:<=,_1       ,e
]}  ;P=f        .t.    map{  _1.sort[_1.      s/
2]  }*''         ;I=  ->x{   x.to_i(2)}       ;;
g=  I[d[          0]*%()]    *+I[             e[
0]  *""]          ;f=I[+     P]*(             I[
P.  tr(*         %w/  10\    01/)]);puts"p1:  #{
g}  \np2        :#{    +f}"  .tr' ','';BEGIN  {;
::                                            IO
class Array;alias:t:transpose;;alias:s:size;end}
