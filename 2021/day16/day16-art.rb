$stdin=open('day16.txt')

B=->{_1.to_i 2}
T=->{_1.slice!0..._2}
D=->p{
  v=B[T[p,3]]
  s=[]
  _=a=""
  (4==t=B[T[p,3]])?
    (a+=_ while ?1==T[_=T[p,5],1];$T?B[a+_]:v):
    (T[p,1]==?0?(p=T[p,B[T[p,15]]];s<<D[p]until""==p):B[T[p,11]].times{s<<D[p]}
      $T?[s.sum,s.reduce(:*),m=s.min,x=s.max,p,s[0]!=m ?1:0,s[1]!=m ?1:0,m==x ?1:0][t]:v+s.sum)
}

puts a=D[''+i=gets.chars.map{'%04b'%_1.hex}*'']
puts b=D[$T=i]

raise unless a == 951
raise unless b == 902198718880
