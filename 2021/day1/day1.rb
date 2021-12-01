lines = open('day1.txt').map(&:to_i)

puts lines
  .each_cons(2)
  .count { |x,y| x < y }

puts lines
  .each_cons(3)
  .map(&:sum)
  .each_cons(2)
  .count { |x,y| x < y }
