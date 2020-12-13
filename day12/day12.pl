# Day 12. we rode a ferry.
open STDIN, 'day12.txt'; # You can omit this if you're just piping in.

                       @t[
                       2..3]
   =(+      10,$o[     2]=1);
 for (     +<>   ){    /./;$n=!/
   [SW           R]    /x?$':-$';$
   n/=         +90     if/[LR]/;$o[$
   a=/       [NS       ]/x]+=$n,$t[$a-
   -2]     +=$         n if/[EWNS]/;@o[0
..1]=map   {$o[$_]+    $n*$o[2+$_]}0..1,@t
                       [00
                       ..1
 ]=map{$t[$_]+$n*$t[2+$_]}0..1 if/F/;if(/[LR]/){
   @o[2..3]=(($x=0<=>$n)*$o[3],($y=$n<=>0)*$o[
       2]),@t[2..3]=($x*$t[3],$y*$t[2])for
            1..abs$n}}($o,$t)=(abs($o
                 [0])+abs$o[1]
 
,abs($t[0])+abs$t[1]);print"Part1: $o\nPart2: $t"
 
