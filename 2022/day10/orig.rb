require_relative '../submitter'

$stdin = open './day10.txt'

x = 1
cycle = 1
strens = []
$stdin.each_line.flat_map { _1[/addx/] ? ['noop',_1] : [_1] }.each do |line|
  cycle += 1
  case line
  when /addx/
    x += $'.to_i
  end

  if (cycle - 20) % 40 == 0
    strens << x * cycle
  end
end
p strens.sum
