$stdin = open 'day4.txt'

o=t=0
$<.map{
  x,y=(eval"[#{_1.gsub ?-,'..'}]").map(&:to_a)
  []!=x&y&&t+=1
  o+=1if(q=x&y)==x||q==y
}

puts [o, t]
raise unless [o,t] == [424,804]
