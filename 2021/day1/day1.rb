lines = open('day1.txt').map(&:to_i)

p lines
  .each_cons(2)
  .count { |_1,_2| _1 < _2 }

puts lines
  .each_cons(3)
  .map(&:sum)
  .each_cons(2)
  .count { |_1,_2| _1 < _2 }
