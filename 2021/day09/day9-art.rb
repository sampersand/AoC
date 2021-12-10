# Day 9: we had to pilot lava tubes.
# (This is a volcano with lava tubes...)
$stdin = open('day9.txt')

            H   =
           {}   ;\
          $<.   zip\
         (0..   ){|l,
        x|l[0   ..-2].
       chars.   zip(0..
){|c  ,y|c==+   ?9||H[x+ y.i]=c
.to_i   }};A=   ->z{[z-  1,z+1,
z-1i,1i     +   z].     select(
&H)};B=->x,     f{f[x   ]=1;A[x
].reject(&f).   map{  B[_1,f]};
f.size};qa=l=   H.   select{_2<
A[_1].map(&H)     .min}.keys;p(
"1:#{l.sum(&H   )} 2:#{l.map{B[
_1,{}]}.max(3   ).reduce:*}");0


