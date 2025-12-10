$* << 'input.txt' if $*.empty?

def rect((x1, y1), (x2, y2))
  (x1 - x2).abs.+(1) * (y1-y2).abs.+(1)
end

X= $<.map { it.chomp.split(',').map(&:to_i) }
q = [0]
X.each { |x|
  X.each { |y| next if x == y;
    d = rect x, y
    q = [d, x, y] if q[0] < d
  }
}
p q
  # .map { [rect(_1, _2), _1, _2] }
  # .then { rect _1, _2}
