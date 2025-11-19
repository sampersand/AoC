$stdin = open('input.txt')
# $stdin = DATA

one = 0
two = Hash.new 0

$stdin.each do |line|
  /Card\s*(?<num>\d+):(?<left>.*?)\|(?<right>.*)/ =~ line
  %r{
    Card \s* (?<num>\d+):
    (?<left>.*?) \|
    (?<right>.*)
  }x =~ line

  two[num = num.to_i] += 1

  left = left.split.map(&:to_i)
  right = right.split.map(&:to_i)
  winners = right.count { |ele| left.any? ele }

  one += 1 << winners - 1
  winners.times { |winning_number| two[num + 1 + winning_number] += two[num] }
end

puts one 
puts two.values.sum
