HEIGHTS={}
open('day9.txt').each_with_index do |line, x|
  line.chomp.chars.each_with_index do |chr, y|
    HEIGHTS[x + y.i] = chr.to_i unless chr == '9'
  end
end

def adj(z)
  [z-1, z+1, z+1i, z-1i].select(&HEIGHTS)
end

def basins(x, found={})
  found[x] = true or return # return if it already exists
  adj(x).reject(&found).each { |new| basins new, found }
  found.length
end

LOW = HEIGHTS
  .select { |z, h| adj(z).all? { |i| h < HEIGHTS[i] } }
  .keys


puts "part1: #{LOW.sum(&HEIGHTS)}"
puts "part2: #{LOW.map { |l| basins l }.max(3).reduce(&:*)}"
