require_relative '../submitter'

#data = download! 2022, 11
$stdin = open 'day11.txt'
monkeys = []

$stdin.each_line("\n\n", chomp: true) do |line|
  monkeys << {
    items: line[/Starting items: (.*)/, 1].split(', ').map(&:to_i),
    operation: line[/Operation: (.*)/, 1],
    test: line[/Test.*?(\d+)/, 1].to_i,
    true => line[/true.*?(\d+)/, 1].to_i,
    false => line[/false.*?(\d+)/, 1].to_i
  }
end

count = Array.new monkeys.length, 0
20.times do 
  monkeys.each_with_index do |monkey, idx|
    count[idx] += monkey[:items].length
    monkey[:items].each do |old; new|
      eval monkey[:operation]
      new /= 3
      monkeys[n = monkey[(new ) % monkey[:test] == 0]][:items] << new
    end
    monkey[:items].clear
  end
end
p count.max(2).reduce :*

__END__
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
