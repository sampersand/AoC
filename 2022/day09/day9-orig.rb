require '../submitter'
require '../shorthand'
using Aoc

lines = download! 2022, 9, lines: true
# lines = <<EOS.lines chomp: true
# R 5
# U 8
# L 8
# D 3
# R 17
# D 10
# L 25
# U 20
# EOS

board = {}
rope = [0 + 0i] * 10


# def puts_board(board)
#   max_x, min_y = board.keys.map(&:real).minmax
#   max_y, min_y = board.keys.map(&:imag).minmax
#   p [*min_x..min_y].product([*min_y..max_y])
#   exit
# end

lines.each do |line|

  case line
  when /D (\d+)/ then n = -1i
  when /U (\d+)/ then n =  1i
  when /L (\d+)/ then n = -1
  when /R (\d+)/ then n =  1
  end

  $1.to_i.times do
    p rope if _1 #== 0

    old_rope = rope.dup
    rope[0] += n

    (0...rope.length - 1).each do |idx|
      if (mag = (rope[idx] - old_rope[idx + 1]).magnitude) > 1.42
        if mag > 1.4
          change = 0
            change += rope[idx].real <=> old_rope[idx + 1].real
            change += (rope[idx].imag <=> old_rope[idx + 1].imag).i
          rope[idx + 1] += change
        else
          # rope = rope + 
          rope[idx + 1] = old_rope[idx] 
        end
      end
    end

    board[rope[-1]] = true
    # puts_board board
  end
    p "done"

=begin

..........................
..........................
..........................
..........................
..........................
..........................
..........................
................H.........
................1.........
................2.........
................3.........
...............54.........
..............6...........
.............7............
............8.............
...........9..............  (9 covers s)
..........................
..........................
..........................
..........................
..........................
=end
    # rope[0] += n
    # old_rope = rope.dup
    # 1.upto(rope.length - 1).each do |idx|
    #   old_head = old_rope[idx - 1]
    #   p [old_head,rope[idx], ?X]

    #   if ((old_head - rope[idx]).magnitude) > 1.42
    #     rope[idx] = old_head
    #   end

    #   p [old_head,rope[idx], ?Y]
    #   board[rope[idx]] = true
    # end
    # p [line, rope]
  # end
  # p board

  # board[head] = 1 unless _1 == 0 || prev_dir&.match?(/[UD]/) && _1 == 1; dir -= 1i
  # prev_dir = $&[0]
  # p board
  # exit
  # if first then board.delete 0+0i end
  # if line.equal?(lines.last) then board.delete dir end
end

submit! board.length,2  #=> 6098 is bad
