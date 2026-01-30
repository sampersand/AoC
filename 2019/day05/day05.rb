$* << 'input.txt'
opcodes = File.read($*[0]).chomp.split(',').map(&:to_i)

def run(opcodes, **map)
  opcodes = opcodes.dup
  map.each { opcodes[_1] = _2 }
  i = 0
  while true
    case opcodes[i]
    when 1
      opcodes[opcodes[i+3]] = opcodes[opcodes[i+1]] + opcodes[opcodes[i+2]]
      i += 4
    when 2
      opcodes[opcodes[i+3]] = opcodes[opcodes[i+1]] * opcodes[opcodes[i+2]]
      i += 4
    when 3
      opcodes[opcodes[i+1]] = gets.to_i#opcodes[i+1]
      i += 1
    when 4
      puts opcodes[opcodes[i+1]]
      i += 1
    when 99
      break
    end
  end
  opcodes.first
end

puts run(opcodes, 1 => 12, 2 => 2)

100.times do |x|
  100.times do |y|
    if run(opcodes, 1 => x, 2 => y) == 19690720
      puts 100*x + y
      exit
    end
  end
end

