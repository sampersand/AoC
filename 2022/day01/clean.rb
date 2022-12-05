$stdin = open 'input.txt'

data = $stdin.readlines("\n\n").map { |line| line.split.sum(&:to_i) }
puts "part 1: #{data.max}"
puts "part 2: #{data.max(3).sum}"

=begin more interesting way
$/ = ""
data = $stdin.map { _1.split.sum(&:to_i) }
p data.max
p data.max(3).sum
=end
