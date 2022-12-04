$stdin = open 'day4.txt'

o = t = 0 ; $< . map {
  / ( \d + ) - ( \d + ) , ( \d + ) - ( \d + ) /x =~ _1
  t += 1 if [] != ( x = * $1 .. $2 ) & ( y = * $3 .. $4 )
  o += 1 if ( q = x & y ) == x || q == y
}
p [o, t]

raise unless [o,t] == [424,804]
