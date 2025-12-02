def valid_1?(x)
  x[...x.length / 2] == x[x.length / 2...]
end

def valid_2?(x)
  x =~ /^(\d+)\1+$/
end


lines = File.read('input.txt')
  .split(',')
  .map { it.split('-').map(&:to_i)  }
  .map { _1.._2 }

puts lines.sum { |range| range.select { valid_1? it.to_s }.sum }
puts lines.sum { |range| range.select { valid_2? it.to_s }.sum }
