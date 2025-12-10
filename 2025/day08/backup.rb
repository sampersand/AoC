# $* << 'sample.txt' if $*.empty?
def one(input, con_c)
  points = input.map { _1.split(",").map(&:to_i) }
  circuts = points.map { [_1] }
  joins = points.combination(2).map do |a, b|
    score = ((a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2 + (a[2] - b[2]) ** 2) ** 0.5
    [a, b, score]
  end.min(con_c) { _1[2] <=> _2[2] }.map { _1[0..1] }
  p circuts
  exit

  joins.each do |(to, from)|
    tos = circuts.find { _1.include?(to) }
    froms = circuts.find { _1.include?(from) }

    next if tos == froms

    circuts.delete(tos)
    circuts.delete(froms)
    circuts.push([*tos, *froms])
  end

  circuts.map { _1.size }.max(3).reduce { _1 * _2 }
end
p one open('input.txt'), 1000
__END__
$* << 'input.txt' if $*.empty?

COORDS = $<.map { it.chomp.split(',').map(&:to_i) }
COORDS.each { def it.inspect = join(',').inspect }

def dist(key, key2) = key.zip(key2).sum { (_1 - _2) ** 2 } ** 0.5

circuits = []
COORDS
  .combination(2)
  .min_by(1001) { dist _1, _2 }
  # .min_by(11) { dist _1, _2 }
  .each { |l, r|
    catch :X do
      circuits.each do |circ|
        if circ.include? l
          circ.add r
          throw :X
        elsif circ.include? r
          circ.add l
          throw :X
        end
      end
      circuits << Set[l, r]
      p [l, r]
    end
  }
circuits.concat COORDS.reject { |x| circuits.any? { it.include? x } }.map { Set[it] }
p circuits.map(&:count).length#.first(3)#.reduce :*
p circuits.map(&:count).max(3)#.first(3)#.reduce :*

__END__

def two_closest(coordinates, connected)
  closest = nil

  coordinates.each do |key|
    coordinates.each do |key2|
      next if key == key2
      next if connected[key]&.include? key2 or connected[key2]&.include? key
      d = dist key, key2

      if closest.nil? || d < closest[-1]
        closest = [key, key2, d]
      end
    end
  end

  closest
end
connected = {}#Hash.new { _1[_2] = [] }
loop do
  closest = two_closest(COORDS, connected)
  break if closest.nil?
  x, y, _ = two_closest(COORDS, connected)
  (connected[x]||=[]) << y
  x, y, _ = two_closest(COORDS, connected)
end
p connected
p [x, y]
