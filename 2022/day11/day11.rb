$stdin =  open 'day11.txt'

MONKEYS = $stdin.each_line("\n\n").map do |line|
  %r/
  Starting items: (?<items>.*)
  Operation: (?<operation>.*)
  Test: divisible by (?<test>\d+)
    If true: throw to monkey (?<if_true>\d+)
    If false: throw to monkey (?<if_false>\d+)/ =~ line

  {
    items: items.split(', ').map(&:to_i),
    operation:,
    test: test.to_i,
    true => if_true.to_i,
    false => if_false.to_i,
  }
end

MAX_DIV = MONKEYS.reduce(1) { _1 * _2[:test] }

def doit(part1)
  result = Hash.new 0
  monkeys = MONKEYS.map { _1.transform_values(&:dup) }

  (part1 ? 20 : 10000).times do 
    monkeys.each do |monkey|
      result[monkey.__id__] += monkey[:items].length

      monkey[:items].each do |old; new|
        eval monkey[:operation]
        new %= MAX_DIV #=
        new /= 3 if part1
        monkeys[monkey[new % monkey[:test] == 0]][:items] << new
      end.clear
    end
  end

  result.values.max(2).reduce(:*)
end

puts doit true
puts doit false
