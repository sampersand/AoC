# $* << 'sample.txt' if $*.empty?
$* << 'input.txt' if $*.empty?

COORDS = $<.map { it.chomp.split(',').map(&:to_i) }

def dist(coord1, coord2) = coord1.zip(coord2).sum { (_1-_2) ** 2 } ** 0.5

circuits = COORDS.map { [it] }
# CIRCUITS = COORDS.to_h { [it => [it]] }

for l, r in COORDS.combination(2).sort_by { dist _1, _2 }
  lsrc = circuits.find { it.include? l }
  rsrc = circuits.find { it.include? r }
  next if lsrc == rsrc
  circuits.delete lsrc
  circuits.delete rsrc
  circuits.push [*lsrc, *rsrc]
  break if circuits.length == 1
end

fail unless 8465902405 == l[0] * r[0]
