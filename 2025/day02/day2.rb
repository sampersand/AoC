lines = File.read('input.txt')
  .split(',')
  .map { it.split('-').map(&:to_i)  }
  .map { _1.._2 }

puts lines.sum { |range| range.select { /^(\d+)\1$/ =~ it.to_s }.sum }
puts lines.sum { |range| range.select { /^(\d+)\1+$/ =~ it.to_s }.sum }
