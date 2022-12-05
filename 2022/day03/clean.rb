 $stdin = open 'input.txt'

# Define what it means to get the priority of an item.
def priority(item)
  ['_', *'a'..'z', *'A'..'Z'].index(item)
end

# For each line from standard in, convert it to an array of its chars.
lines = $stdin.map(&:chars)

# Part 1: Get the common item between the first and second halves.
one = lines.sum { |line|
  # Split the line into the first and second halves
  half1 = line[...line.size/2]
  half2 = line[line.size/2...]

  # Find the common element
  common = (half1 & half2).first

  # Then return the priority of that element.
  priority common
}

# Part 2: Get the common item from three consecutive parts
two = lines.each_slice(3).sum { |lines|
  # The common item is the result of set interaction of all three lines.
  common = lines.reduce(&:&).first

  # Simply return the priority of the common element
  priority common
}

puts "Part one: #{one}"
puts "Part two: #{two}"

