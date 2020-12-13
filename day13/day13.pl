# Day 13, we rode a bus.
open STDIN, "day13.txt"; # omit this if piping it in

 $e=<>;@t=split",",<>=~tr/x/1/r;$m=inf;($x=int
($    e       /$      _+      1)  *  $_      )>
$m    or      $m      =$      x,  $  i=       $_
for(grep!/1/,@t);@s=sort{$b<=>$a  }  map{++$u;"$_
$u"}@  t;@  n=map{(split)[0]}@s;  @  i=  map  {+(
split )[1]} @s;$a=$n[0];$c=-$i[0]%$n[0] ;for( 1..
       $#n                               ){$

j=$_;$c+=$a until$c%$n[$_]==-$j[$j]%$n[$j];$a*=$n
[$j]}print"Part 1: ",($m-$e)*$i,"\nPart 2: $c\n";
