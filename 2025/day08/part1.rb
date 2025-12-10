$* << 'input.txt' if $*.empty?

COORDS = $<.map { it.chomp.split(',').map(&:to_i) }

def dist(key, key2) = key.zip(key2).sum { (_1 - _2) ** 2 } ** 0.5

circuits = COORDS.map { [it] }
COORDS
  .combination(2)
  .min_by(1000) { dist _1, _2 }
  .each { |l, r|
    lsrc = circuits.find { it.include? l }
    rsrc = circuits.find { it.include? r }
    next if lsrc == rsrc
    circuits.delete lsrc
    circuits.delete rsrc
    circuits.push [*lsrc, *rsrc]
  }

a =  circuits.map(&:count).max(3).reduce :*
fail unless a == 181584
