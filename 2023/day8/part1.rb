$stdin = open 'input.txt'
# $stdin = DATA

dir = gets.chomp.chars.map{_1=='L' ? 0:1 }.cycle
gets
map = $stdin.map { [_1[/(\w+) = \((\w+), (\w+)\)/, 1], [$2, $3]] }.to_h

acc = 'AAA'
amount = 0
until acc == 'ZZZ'
  amount += 1
  fail if acc == (acc = map[acc][dir.next])
  p acc
end

p amount
# dir.each
# p dir.cycle
# p map

__END__
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
