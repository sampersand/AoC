open STDIN,'day18.txt';$l=join'+',map{y/*/-/;s/\d+/bless([$&])/g;"($_)"}<>;
use overload'+',$x=sub{bless[$_[0][0]+$_[1][0]]},'/',$x,'*',$y=sub{
bless[$_[0][0]*$_[1][0]]},'-',$y;print"Part 1: ",eval($l)->[0
],"\nPart 2: ", eval($l=~y|+|/|r)->[0],"\n";
