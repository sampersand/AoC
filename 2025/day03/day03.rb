def find_largest(chars, remaining)
  return '' if remaining.zero?

  max = chars[..-remaining].max
  rest = chars[chars.index(max)+1..]

  max + find_largest(rest, remaining-1)
end

part1 = part2 = 0

File.foreach('input.txt') do |line|
  chars = line.chomp.chars

  part1 += find_largest(chars, 2).to_i
  part2 += find_largest(chars, 12).to_i
end

p [part1, part2]
