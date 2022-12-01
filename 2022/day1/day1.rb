$stdin = open 'day1.txt'


$/ = ""
data = $stdin.map { _1.split.sum(&:to_i) }
p data.max
p data.max(3).sum
