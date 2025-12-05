#!/bin/zsh

if [[ ! -t 0 ]] exec < sample.txt

ranges=()
fresh=()
while IFS=- read -A input; do
	if (( $#input == 2 )) {
		ranges+=( "$input" )
	} else {
		fresh+=( $input )
	}
done

integer part1
foreach id ($fresh)
	foreach start stop ($=ranges)
		if (( start <= id && id <= stop )) {
			let part1++
			continue 2
		}
	end
end

p $part1

fresh_ranges=()
while (( $#ranges )) do
	range=$ranges[1]; shift ranges

	overlaps=()
	for ((fresh_ranges
done

function merge {
}
exit
exit
class Range
  def merge?(other)
    overlap?(other) and Range.new(*[*other.minmax, *minmax].minmax)
  end
end

fresh_ranges = []
while (range = ranges.pop)
  overlaps = []
  fresh_ranges.reject! { tmp = range.merge?(it) and overlaps << tmp }

  if overlaps.empty?
    # if nothing overlaps, add the range to the known part1 ranges
    fresh_ranges << range
  else
    # add anything that did overlap back into the input range list
    ranges.concat overlaps
  end
end

part2 = fresh_ranges.sum(&:count)
fail unless part1 == 885
fail unless part2 == 348115621205535
