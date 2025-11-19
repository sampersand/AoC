$stdin = open 'input.txt'

def diff(inp)
  return 0 if inp.all? 0 
  q = diff r = inp.each_cons(2).map{_2 - _1}
  p [q, r]
  inp.last + q
end

p $stdin.sum { |line|
  inp = line.split.map(&:to_i)
  p diff inp
  # p inp
  # p inp.each_cons(2).map{_2 - _1}
  # exit
}
__END__
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
