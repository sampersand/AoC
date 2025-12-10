# $* << 'sample.txt' if $*.empty?
$* << 'input.txt' if $*.empty?

COORDS = $<.map { it.chomp.split(',').map(&:to_i) }
# COORDS.each { def it.inspect = join(',').inspect }

def dist(key, key2) = key.zip(key2).sum { (_1 - _2) ** 2 } ** 0.5

circuits = COORDS.map { [it] }
COORDS
  .combination(2)
  .min_by(1000) { dist _1, _2 }
  .each { |l, r|
    # catch :X do
      lsrc = circuits.find { it.include? l }
      rsrc = circuits.find { it.include? r }
      next if lsrc == rsrc
      circuits.delete lsrc
      circuits.delete rsrc
      circuits.push [*lsrc, *rsrc]

      # circuits.each do |circ|
      #   if circ.include? l
      #     circ.add r
      #     throw :X
      #   elsif circ.include? r
      #     circ.add l
      #     throw :X
      #   end
      # end
      # circuits << Set[l, r]
      # p [l, r]
    # end
  }
  # p circuits
# circuits.concat COORDS.reject { |x| circuits.any? { it.include? x } }.map { Set[it] }
# p circuits.map(&:count).length#.first(3)#.reduce :*
a =  circuits.map(&:count).max(3).reduce :*#.first(3)#.reduce :*
fail unless a == 181584

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
