$stdin = open 'input.txt'

DIRECTIONS = gets.chomp.chars.map{ 'LR'.index _1 }
gets
MAP = $stdin.map do
  /(?<start>\w+) = \((?<left>\w+), (?<right>\w+)\)/ =~ _1
  [start, [left, right]]
end.to_h

amounts = MAP.keys.filter_map do |key|
  next unless key.end_with? 'A' # only select starting positions
  amnt = 0
  dirs = DIRECTIONS.cycle
  amnt, key = amnt+1, MAP[key][dirs.next] until key.end_with? 'Z'
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
