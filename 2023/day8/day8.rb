$stdin = open 'input.txt'
# $stdin = DATA

dirs = gets.chomp.chars.map{_1=='L' ? 0:1 }
gets
map = $stdin.map { [_1[/(\w+) = \((\w+), (\w+)\)/, 1], [$2, $3]] }.to_h

amounts = map.keys.select { _1[/A$/] }.map do |acc|
  amnt = 0 
  dir = dirs.cycle
  until acc.match? /Z$/
    amnt += 1
    acc = map[acc][dir.next]
  end
  amnt
end
p amounts.reduce(&:lcm)
__END__
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
