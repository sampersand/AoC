require '../submitter'
require '../shorthand'
using Aoc

lines = download! 2022, 9, lines: true
lines = <<EOS.lines chomp: true
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
EOS
board = {}
rope = [0i]*10
lines.each do |line|

  case line
  when /D / then n = -1i
  when /U / then n =  1i
  when /L / then n = -1
  when /R / then n =  1
  end

  $'.to_i.times do
    rope[0] += n
    old_rope = rope.dup
    1.upto(rope.length - 1).each do |idx|
      old_head = old_rope[idx - 1]
      p [old_head,rope[idx], ?X]

      if ((old_head - rope[idx]).magnitude) > 1.42
        rope[idx] = old_head
      end

      p [old_head,rope[idx], ?Y]
      board[rope[idx]] = true
    end
    p [line, rope]
  end
  # p board

  # board[head] = 1 unless _1 == 0 || prev_dir&.match?(/[UD]/) && _1 == 1; dir -= 1i
  # prev_dir = $&[0]
  # p board
  # exit
  # if first then board.delete 0+0i end
  # if line.equal?(lines.last) then board.delete dir end
end

p board.length 
