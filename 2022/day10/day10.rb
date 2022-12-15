$stdin = open './day10.txt'

register = cycle = 1

strengths = 0
grid = ['']

$stdin.each do |instruction|
  grid.last.concat grid.last.length.between?(register-1, register+1) ? '#' : ' '

  strengths += register * cycle if (cycle - 20) % 40 == 0
  grid.push ''                  if cycle % 40 == 0

  cycle += 1

  redo if instruction.delete_prefix!('addx')
  register += instruction.to_i
end

puts strengths
puts grid
