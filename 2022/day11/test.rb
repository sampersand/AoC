require_relative '../submitter'

data = download! 2022, 11
$stdin =  open 'day11.txt'
monkeys = []

$stdin.each_line("\n\n", chomp: true) do |line|
  monkeys << [
    line[/Starting items: (.*)/, 1].split(', ').map(&:to_i),
    line[/Operation: (.*)/, 1],
    line[/Test.*?(\d+)/, 1].to_i,
    line[/true.*?(\d+)/, 1].to_i,
    line[/false.*?(\d+)/, 1].to_i
  ]
end

max_div = monkeys.map { _1[2] }.reduce(:*)

count = Array.new monkeys.length, 0
10000.times do 
  monkeys.each_with_index do |(items, operation, test, ift, iff), idx|
    count[idx] += items.length
    items.each do |old; new|
      eval operation
      new %= max_div #%
      monkeys[new % test == 0 ? ift : iff][0] << new
    end
    items.clear
  end
  # break if _1 > 1000
end

submit! count.max(2).reduce(:*), 2
