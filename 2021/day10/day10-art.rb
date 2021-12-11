# Day 10: We had to match braces properly
$stdin=open('day10.txt')

             o=00;     t=[   ];$<.   map{|   l|;     ;x=[*
     0..    999       ];;    for       xyz    in(       x);   ;a\
   =l.      sub     %r@      \[A       ?\]      |\(     \)|     \{a
  ?\}       |<>     |\n      @x,       %@@      ;if     a==      l;0
 x[0       ..-     1]=       [];       end       ;l=     +a;      end
l=~      /[\])     }>]       /x?       o+=       {?)     =>3,+     ?]\
 =>3       *19     ,?}       =>+       19*       63,     -?>      =>+  
  441       *57     }[-      $&]       :t.      <<(     (q=      ->\
   s,i      {l[     ~i]      ?q[       s*5      +('     +([     {<'.
    tr(     ?\s      ,""     )=~       /#{     ?\\      +l[    ~i]
     }/)    ,i+       1]:    s};       )[0    ,0]       )};   a=t.
             sort[     +t.   size/   2];p(   ;[o     ,a]);

# oops, i mesed this up and added an extra row, and tried to fix it.
