$* << 'input.txt' if $*.empty?

COORDS = $<.map { it.chomp.split(',').map(&:to_i) }
CIRCUITS = COORDS.map { Set[it] }

def distance(coord1, coord2) = coord1.zip(coord2).sum { (_1-_2) ** 2 } ** 0.5

n = 0
for l, r in COORDS.combination(2).sort_by { distance _1, _2 }
  if (n += 1) == 1000
    $part1 = CIRCUITS.map(&:count).max(3).reduce(:*)
  end

  # Find each one's circuit
  l_circuit = CIRCUITS.find { it.include? l }
  r_circuit = CIRCUITS.find { it.include? r }

  # If they're the same, do nothing
  next if l_circuit == r_circuit

  # Add the right circuit to the left
  l_circuit.merge CIRCUITS.delete(r_circuit)

  # Stop if we're at the end
  break if CIRCUITS.length == 1
end

$part2 = l[0] * r[0]
puts $part1, $part2
