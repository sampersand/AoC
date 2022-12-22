$stdin = open 'day6.txt'

LINE = gets

def solve(amnt)
  LINE
    .chars
    .each_cons(amnt)
    .find { |window| window.uniq.length == amnt }
    .join
    .then { amnt + LINE.index(_1) }
end

puts solve 4
puts solve 14
