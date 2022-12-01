data = open('day1.txt').map(&:to_i)
puts "part 1: #{data.sum}"

require 'set'
sum = 0
acc = Set.new [0]

data.cycle.each do |v|
  break unless acc.add? sum += v
end

puts "part 2: #{sum}"
