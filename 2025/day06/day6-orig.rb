$* << 'input.txt' if $*.empty?

input = $<.map(&:chomp)
seps = input.pop.split
max_width = input.map(&:length).max
# p input.map { it.ljust(max_width) }
# lines = input.
p input.map { it.ljust(max_width).chars}
.transpose.map(&:join)
.slice_before { it.strip.empty? }.to_a.tap { it.first.prepend ' ' }
.map { it[1..].map(&:to_i) }
.zip(seps).map { a = _1.reduce _2; p [a, _1, _2]; a }
.sum
