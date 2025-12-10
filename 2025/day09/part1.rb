$* << 'sample.txt' if $*.empty?
$* << 'input.txt' if $*.empty?

def red_or_green?(x, y)
  red?(x,y) or green?(x,y)
end

def red?(x, y) = RED.include? [x,y]

$GREEN={}
def green?(x, y)
  $GREEN[x+y.i] ||= RECTS.any? { _1.include?(x) and _2.include?(y) }
  ->x,y{
  RED.each do |a|
    RED.each do |b|
      mx = Range.new *([a[0], b[0]].minmax)
      my = Range.new *([a[1], b[1]].minmax)
      if mx.include?(x) && my.include?(y)
        p [a, b, mx, my]
        return true
      end
    end
  end
  }.(x,y)
end

def rect((x1, y1), (x2, y2))
  (x1 - x2).abs.+(1) * (y1-y2).abs.+(1)
end

RED= $<.map { it.chomp.split(',').map(&:to_i) }
RECTS=Set[]
RED.each do |a|
  RED.each do |b|
    mx = Range.new *([a[0], b[0]].minmax)
    my = Range.new *([a[1], b[1]].minmax)
    RECTS << [mx, my]
  end
end

MIN_X, MAX_X = RED.map(&:first).minmax
MIN_Y, MAX_Y = RED.map(&:last).minmax
p RED
p green? 2, 3
p green? 3, 2
exit

q = [0]
RED.each { |a|
  RED.each { |b| next if a == b;
    next unless a == [11, 1] and b == [2,5]
    d = rect a, b
    next unless q[0] < d
    catch :nope do
      mx = Range.new *([a[0], b[0]].minmax)
      my = Range.new *([a[1], b[1]].minmax)
      mx.each do |x|
        my.each do |y|
            p [x, y]
          unless red_or_green? x, y
            throw :nope
          end
        end
      end
      q = [d, a, b]
      p yes: q
    end
  }
}

p q
  # .map { [rect(_1, _2), _1, _2] }
  # .then { rect _1, _2}
