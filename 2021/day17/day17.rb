$stdin = open('day17.txt')

gets =~ /x=(-?\d+)\.\.(-?\d+), y=(-?\d+)\.\.(-?\d+)/
XRANGE=$1.to_i..$2.to_i
YRANGE=$3.to_i..$4.to_i

def run(velo)
  maxy = pos = 0

  loop do
    maxy = pos.imag if maxy < pos.imag
    return maxy if XRANGE.include?(pos.real) && YRANGE.include?(pos.imag)
    return false if velo.real.zero? && pos.imag < YRANGE.end

    pos += velo
    velo -= 1 unless velo.real.zero?
    velo -= 1i
  end
end

maxy = acc = 0
0.upto 250 do |x|
  -250.upto 250 do |y|
    next unless m = run(x+y.i)
    acc += 1
    maxy = m if maxy < m
  end
end

puts "part1: #{maxy}, part2: #{acc}"
