$stdin = open 'day9.txt'
board1 = {}
board2 = {}
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

    q = [rope[0]] + rope.each_cons(2).map { |head, tail|
      next tail unless 2 <= (head-tail).magnitude
      tail + (head.real <=> tail.real) + (head.imag <=> tail.imag).i
    }
    # q = rope.zip(rope[1..] + [0]).map  { next _1 unless 2 <= (_1 - _2).magnitude
    #   _2 + ((_1.real <=> _2.real) + (_1.imag <=> _2.imag).i)
    # }
    rope.length.pred.times do |idx|
      next unless 2 <= (rope[idx] - rope[idx + 1]).magnitude
      rope[idx + 1] += (rope[idx].real <=> rope[idx + 1].real) + (rope[idx].imag <=> rope[idx + 1].imag).i
    end
    p rope
    p q
    fail unless rope == q
    # exit

    board1[rope[ 1]] = true
    board2[rope[-1]] = true
  end
end

p board1.length
p board2.length

raise unless board1.length == 6098
raise unless board2.length == 2597
