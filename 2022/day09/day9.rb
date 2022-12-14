require 'set'

$stdin = open 'day9.txt'
board1 = Set.new
board2 = Set.new
rope = Array.new(10, 0i)

$stdin.each do |line|
  case line
  when /D (\d+)/ then n = -1i
  when /U (\d+)/ then n =  1i
  when /L (\d+)/ then n = -1
  when /R (\d+)/ then n =  1
  end

  $1.to_i.times do
    rope[0] += n

    rope.length.pred.times do |idx|
      head = rope[idx]
      tail = rope[idx + 1]

      next unless 2 <= (head - tail).magnitude
      rope[idx + 1] += (head.real <=> tail.real) + (head.imag <=> tail.imag).i
    end

    board1.add rope[ 1]]
    board2.add rope[-1]]
  end
end

p board1.length
p board2.length

raise unless board1.length == 6098
raise unless board2.length == 2597
