$stdin = open('day10.txt')

part1 = 0
part2 = []
$stdin.each_line do |line|
  line.chomp! # delete trailing newline
  nil while line.gsub! /\[\]|\(\)|\{\}|<>|\n/, '' # strip all matching pairs

  if line =~ /[\])}>]/
    # if we have a corrupt line, then add it to part1
    part1 += { ')' => 3, ']' => 57, '}' => 1197, '>' => 25137 }[$&]
  else
    # otherwise, add the calculated value to part2
    part2.push line.reverse.each_char.reduce(0) { _1*5 + ' ([{<'.index(_2) }
  end
end

puts part1
puts part2.sort[part2.length/2]
