# Day 2's code art, in Ruby!
#
# We had to deal with duplicate numbers, so the art is `0202`

$* << 'input.txt' if $*.empty? # Provide a default if no args given

 (l=File.     read(+      $*[0]).     split(-
?,).map{;   it.split(    '-').map(   &:to_i)=>
a,b   ;+a   ..b   };o    =l.   sum   {f(   _1\
){     /^        (\d     +)     \1        $/x.
=~     %|      #{it      }|     [6      ..]}.
sum   };t    =+l.        sum   {f(    _1){
/^(\d+)\1   +$/x=~it.    to_s}.sum   };puts o,t
 )if def    f(x,&)=x.     filter(    &);"Samp";
