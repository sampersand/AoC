$stdin = open('day17.txt')
$stdin = DATA

def step(probe)
  probe[0] += probe[1]
  probe[1] -= 1 unless probe[1].real.zero?
  probe[1] -= 1i
end

def check(probe, x, y)
  if x.include? probe[0].real and y.include? probe[0].imag
    true
  elsif probe[1].real.zero? && probe[0].imag < y.end
    :past
  else
    :before
  end
end

# x=20..30, y=-10..-5
def run(init, x, y)
  probe = [0+0i, init]
  maxy = nil
  loop do
    if maxy.nil? || maxy < probe[0].imag
      maxy = probe[0].imag
    end

    case check probe, x, y
    when :past then return false
    when true then return maxy
    when :before then step probe
    end
  end
end

X=60..94
Y=-171..-136
maxy = nil
m2 = nil

acc = 0
(0..250).each do |x|
  p x
  (-250..250).each do |y|
    if (m = run x+y.i, X, Y)
      acc += 1
      if m2.nil? || m2 < y 
        maxy = y
        m2 = m
      end
    end
  end
end

p acc
# p run 6+9i, 20..30, -10..-5
p [maxy, m2]
# puts run 17-4i, 20..30, -10..-5
# target area: 

# input = {}
# $stdin.map(&:chomp).each do |line|
# end

__END__
