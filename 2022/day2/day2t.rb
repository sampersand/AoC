require_relative '../submitter'
data = download! 2022, 2

# p data.each_line.map {
#   (_1['Y'] ? {'A'=>1,'B'=>2,'C'=>3}[_1[0]] +3: _1['X'] ? {'A'=>3,'B'=>1,'C'=>2}[_1[0]] : 6 + {'A'=>2,'B'=>3,'C'=>1}[_1[0]])
# }.sum
o=[]
t=[]
i=->{_1.index(_2)}
data.lines {
  a,_,x,=_1.chars
  n=i['XYZ',x]

  # a='B'
  # x='X'
  # p i['CAB',x.tr('XYZ','ABC')]*3
  # p [a, x, (a==x.tr('YXZ','ACB')?6:a==x.tr('XYZ','ABC')?3:0)]
  # exit

  o<< 1+n+(a==x.tr('YXZ','ACB')?6:a==x.tr('XYZ','ABC')?3:0)
  t<< n*3+1+i['BCA'.chars.rotate(-n)*'',a]
}
p o.sum
p t.sum
__END__
p data.each_line.map {
}.sum
# submit! 
# # submit! 'answer', 1
# # submit! 'answer', 2

