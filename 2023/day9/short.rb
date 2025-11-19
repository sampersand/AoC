$stdin = open 'input.txt'
# $stdin = DATA

d=->n,i{i|[]==[0]?0:i[n]+d[n,i.each_cons(2).map{_1[n]-_1[n+1]}]}
d=->n,i{i==[]?0:i[n]+d[n,i.each_cons(2).map{_1[n]-_1[n+1]}]}

puts $stdin.map { q = _1.split.map(&:to_i); [d[-1, q], d[0, q]] }
    .reduce([0,0]) { _1.zip(_2).map(&:sum) }
__END__
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
