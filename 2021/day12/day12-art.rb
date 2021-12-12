# Day 12, we had to navigate a cave system

              $stdin=open('day12.txt')
         G={};$<.map{_1.chomp=~/-/;(G[$`]||=[\
      ])<<$';(G[$']||=[]  )<<+  $`};S='start';$:
    R=->v=[],i= p,s=S{a   =[]    ;next[ [s]]if(s==
  %/end/);s[/    [a-z      ]      /x]    &&(next[]\
  if[s]== v       &[                s      ]  &&i;(S
 .!=s)&&   !        i                         &!!$p&&
 (;G[s]                    -                   v).map{
 a+=R[             v       ,        1           ,_1]};
;v+=[    s]       );(     G[       s]      -     []-v).
map{a+=R[v,i,_1]};a.map{_1<<s}.uniq};$p=R[].size;b=R[].
size;puts(%[part\s1:\s#$p\npart\s2:\s#{b}]);@sampersand
