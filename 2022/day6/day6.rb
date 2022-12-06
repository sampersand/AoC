$stdin = open 'day6.txt'

LINE = gets

def solve(amnt)
  amnt + LINE.index(LINE
    .chars
    .each_cons(amnt)
    .find { |window| window.uniq.length == amnt }
    .join)
end

puts solve 4
puts solve 14
