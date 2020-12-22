sub play {
	@p1=@{$_[0]}
}
__END__
require 'set'

def play(pl)
	until pl.any?(&:empty?)
		c = pl.map(&:shift)

		if (x = yield c).nil? ? c[1] < c[0] : x
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

PL = open('day22.txt').each_line("\n\n").map { _1.chomp.lines.drop(1).map(&:to_i) }
p play(PL.map(&:dup)) {}
recur PL
p $ans

__END__
Player 1:
9
2
6
3
1

Player 2:
5
8
4
7
10
