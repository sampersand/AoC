# Day 11: we had to navigate by octopus lights
$stdin = open('day11.txt')
                           ;g={};
                          $<.map{|
                         l|l.chars[
                          ..-002].
                           zip(0\
                                    ..){
                                   g[_2.\
                                    i+$.
                               ]=_1
            .to_i}};x=s       =0;(1\
        ..).map{|n|g.map{g[    _1]=
       1+ _2};x.map{|k,_| g[
         k]=p;[1-1i,-1i,1,
         -1+1i,-1-1i,1+1i,
          -1,1i].map{k+_1          }.
 select(  &g).map{g[_1]+=1}}   until
{}  ==x=g.select{_2&.>9};g.map{g[
   _1 ]=_2||(s+=1;0)};p(s)if+100==
  n;    if[0]==g.map{_2}|[];    p(
   n)   ; break   end   };%/     L\
   `O\     OA      {9 .    }5     A
            \O}    `L7  , 49
                         p/
