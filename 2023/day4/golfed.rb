$stdin = open('input.txt')

t=Hash.new o=0
$<.each{|i|
  t[$.]+=1
  l,r=i[/:\K.*/]. (?|).map{_1.split.map &:to_i}
  o+=1<<~-f=(l&r).size
  f.times{t[$.+1+_1]+=t[$.]}
}
t=t.values.sum
p [o,t]

# sanity check
fail unless o==26346
fail unless t==8467762
