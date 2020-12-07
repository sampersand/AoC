# Day 6, quest.
Io.File('day6.txt')
	.lines()
	.chunk_while(~$itself)
	.map(line -> { line.gsub(/\s/, '') })
	.map(~$unique)
	.map(~$len)
	.sum()
	.tap(print << "Part 1: ");

# work in progress
# 6735
# 3220[Finished in 0.3s]
##__EOF__##
# PART 1:
$/=""; # paragraph mode, you're my savior.

DATA
	.each_line
	.map { _1.gsub(/\s/,"").chars.uniq.count }
	.sum
	.display

# Reset between parts
puts;DATA.seek 299

# Part 2:
$/="";
DATA
	.each_line
	.map { _1.split.map(&:chars).reduce(&:&).count }
	.sum
	.display
