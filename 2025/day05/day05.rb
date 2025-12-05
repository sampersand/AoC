$* << 'input.txt' if $*.empty?

ranges = $<.gets('')
  .lines
  .map { it =~ /-/; $`.to_i..$'.to_i}
  .tap(&:pop)

part1 = $<.count { |line| ranges.any? { it.include? line.to_i } }

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
