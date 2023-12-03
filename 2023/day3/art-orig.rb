#!/bin/ruby
$stdin = open('input.txt')

G,j,o={},0,[]
(L=$stdin).map{_1.scan(/[^\s\d.]/){G[$`.size.i+j]=[]};j+=1}
j=L.rewind;
L.map{_1.scan(/\d+/){($`.size-1..$~.end(0)).map{|y|(-1..1).%(1){|x|(G[y.i+x+j]||next)<<$&.to_i;o<<$&}}};j+=1}
p o.uniq(&:__id__).sum(&:to_i),G.sum{_2[1]&&!_2[2]?_2[0]*_2[1]:0}
