LINES = open('day10.txt')
  .reject(&:empty?)              # delete trailing line
  .map(&:to_i)                   # convert each line to a number
	.sort                          # sort them
	.unshift(0)                    # add 0 to the start
	.tap { _1.push _1.last + 3 }   # add the builtin adaptor to the end.

LINES
	.each_cons(2)                  # ever group
	.map { _1.reduce(&:-) }        # get the diff
	.tally                         # tally up
	.filter_map { _1 != -2 && _2 } # ignore `_2`s
	.reduce(&:*)                   # get the product
	.tap { puts "Part 1: #{_1}"}   # print it out

def part2(curr=0, lines=LINES, memo={ lines.max => 1 })
	memo[curr] ||=
		lines
			.take_while { _1 - curr <= 3 }
			.each_with_index
			.map { part2 _1, lines[_2+1..], memo }
			.sum
end

puts "Part 2: #{part2 / 2}"
