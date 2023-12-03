#!/bin/ruby
# Day 3, 2023: "GOT GEARS?"; we had to ride a gondola after
# fiddling with some gears

$stdin = open('input.txt') # omit if reading from stdin

                                                j,G=0,{}
                                        L=$stdin
                                L.map{_1
                        .scan(/[^
         \d.]/  ){G[j+$`
        .size.i]=
[]};j+=1  };                o,j=    [],L   .rewind
          L.               map     {g  =/    \d+
          /x;r             =-1     ..  1;    ;_1
           .scan(g)        {q= $&  ;(  ~-    $`.
             size           ..$~    .end(    0))
      .map{|y|r.%(1){|x|
    next      if  !f= G[y.          i+  x+  j]     ;f<<
   I[$&       ];  o<<  $&}}           };j+=1      };  v=G
   .sum       {a  ,b,  c=_2         ;(!c  &b)?       (a*
   b):0       },   "   SAMP         ERSA  ND"       &&o
   .uniq(&:__id__).sum(&I);           BEGIN{        //
    I=->{_1.to_i}};p v[1],          v[  0]  ;;      ;;
