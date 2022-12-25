$stdin = open 'day1.txt'

# Pretty simple day. Ruby lets you use any arbitrary string for "end of line",
# so we use `\n\n` as the delimiter. We then just take each grouping of lines
# and sum them up.
data = $stdin.readlines("\n\n").map { |lines| lines.split.sum(&:to_i) }
puts "part 1: #{data.max}"
puts "part 2: #{data.max(3).sum}"
