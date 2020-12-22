require 'set'

def play(pl)
	until pl.any?(&:empty?)
		c = pl.map(&:shift)

		if (x = yield c).nil? ? c.reduce(:<=>).positive? : x
			pl.first.concat c
		else
			pl.last.concat c.reverse
		end
	end

	$ans = pl.first.reverse.unshift(0).each_with_index.map(&:*).sum
end

def recur(pl)
	memo = Set.new

	play pl do |c|
		memo.add? pl.hash or return true
		if c.zip(pl.map(&:length)).all? { _1 <= _2 }
			recur pl.zip(c).map { _1.first _2 }
		end
	end

	pl.last.empty?
end

PL = open('day22.txt')
	.each_line("\n\n")
	.map(&:chomp)
	.map(&:lines)
	.map { _1.drop(1).map(&:to_i) }

p play(PL.map(&:dup)) {}
recur PL
p $ans
