require '../submitter'
require '../shorthand'
using Aoc

lines = download! 2022, 9, lines: true
# lines = <<EOS.lines chomp: true
# R 4
# U 4
# L 3
# D 1
# R 4
# D 1
# L 5
# R 2
# EOS
board = {0i=>1}
coord = 0+0i
head = 0i
tail = 0i


lines.each do |line|
  first = line.equal?(lines.first)

  # i += 1
  old_dir = ($&||"")[/[DU]/] ? /[DU]/ : /[LR]/
  # q = i > 2 && !line.equal?(lines.last)
  case line
  when /D / then n = -1i
  when /U / then n =  1i
  when /L / then n = -1
  when /R / then n =  1
  end

  same_ = old_dir.nil? #|| old_dir.match?($&)
  $'.to_i.times do
  tail2 = nil
    old_head = head
    head = head + n
    tail2 = old_head if ((head - tail).magnitude) > 1.42
    same_ = true # 
    # p [head, tail]
    # p [line, tail, tail2, old_head, (head - tail).magnitude]
    tail = tail2 || tail
    # tail, head = head, head + n
    board[tail] = true
  end
  # p board

  # board[head] = 1 unless _1 == 0 || prev_dir&.match?(/[UD]/) && _1 == 1; dir -= 1i
  # prev_dir = $&[0]
  # p board
  # exit
  # if first then board.delete 0+0i end
  # if line.equal?(lines.last) then board.delete dir end
end

submit! board.length 
