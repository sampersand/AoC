require 'set'


def n(b); b.first end
def s(b); b.last end
def e(b); b.map(&:last) end
def w(b); b.map(&:first) end

class Tile
	attr_reader :name, :board

	def initialize(name, board)
		@name = name
		@board = board
	end

	def init_perm!
		@permutation = permutations.first
	end

	def inspect; "Tile(#@name, #{!!defined? @permutation})" end

	def permutations;
		@permutations ||=
			[@board, @board.transpose]
				.map { [_1, _1.reverse, _1.map(&:reverse), _1.reverse.map(&:reverse)] }
				.flatten(1)
				.to_set
				.freeze
	end

	def inner
		@permutation[1..-2].map { _1[1..-2] }.freeze
	end

	def permute(edge, tile_is_of_self)
		permutation = (permutations.find { edge == send(tile_is_of_self, _1) } or return).freeze
		@permutation = permutation
	end

	def neighbors
		@neighbors ||= begin
			t = $tiles.dup
			t.delete self
			[t.find { _1.permute(n(@permutation), :s) }.tap { t.delete _1 },
			 t.find { _1.permute(s(@permutation), :n) }.tap { t.delete _1 },
			 t.find { _1.permute(e(@permutation), :w) }.tap { t.delete _1 },
			 t.find { _1.permute(w(@permutation), :e) }]
		end
	end

	def to_s
		@permutation.map(&:join).join("\n")
	end
end

$/=""

$tiles=Set.new

open("day20.txt").map(&:chomp).each do |l|
	name, *lines = l.split("\n")
	$tiles.add Tile.new(name[/\d+/].to_i, lines.map(&:chars))
end

$/="\n"

def make_grid(tile, neighbors, x=0, y=0)
	neighbors[[x, y]] || !tile and return
	neighbors[[x, y]] = tile
	nbrs = tile.neighbors

	make_grid nbrs[0], neighbors, x, y-1
	make_grid nbrs[1], neighbors, x, y+1
	make_grid nbrs[2], neighbors, x+1, y
	make_grid nbrs[3], neighbors, x-1, y
end

make_grid $tiles.first.tap(&:init_perm!), neighbors = {}
min = neighbors.keys.min

ary = (min[1]..min[1]+11).map do |y|
	(min[0]..min[0]+11).map do |x|
		neighbors[[x, y]]
	end
end

grid =
	ary
		.map { |l| l.reduce(Array.new(8){""}) { |a, r|
				a.zip(r.inner.map(&:join)).map { _1 + _2 }
			}.join("\n")
	}.join("\n")

class String;
	def monsters
	split("\n").map { |line| line.chars.each_with_index.map { eval("\"\\u01%02x\""%_2) + _1 }.join }.join("\n")
	.gsub!(%r{\
(?<=$|\n)(?<a>.*)(?<b>[^#.@])(?<c>....................................)#(?<d>.*\n)\
^(?<e>.*)\k<b>#(?<f>.........)#(?<g>.)#(?<h>.........)#(?<i>.)#(?<j>.........)#(?<k>.)#(?<l>.)#(?<m>.*\n)\
^(?<n>.*)\k<b>(?<o>..)#(?<p>.....)#(?<q>.....)#(?<r>.....)#(?<s>.....)#(?<t>.....)#}, <<'EOS'.gsub(/\s/,"")
\k<a>\k<b>\k<c>.\k<d>
\k<e>\k<b>.\k<f>.\k<g>.\k<h>.\k<i>.\k<j>.\k<k>.\k<l>.\k<m>
\k<n>\k<b>\k<o>.\k<p>.\k<q>.\k<r>.\k<s>.\k<t>.
EOS
)&.gsub(/[^.\n#]/,'')&.then { _1.monsters || _1 }
end end

print "Part 2: "
(grid.monsters || 
	grid.split("\n").reverse.join("\n").monsters ||
	grid.split("\n").map { _1.chars.reverse.join }.join("\n").monsters ||
	grid.split("\n").map { _1.chars.reverse.join }.reverse.join("\n").monsters ||
	grid.split("\n").map(&:chars).transpose.map(&:join).join("\n").monsters ||
	grid.split("\n").reverse.join("\n").monsters ||
	grid.split("\n").map { _1.chars.reverse.join }.join("\n").monsters ||
	grid.split("\n").map { _1.chars.reverse.join }.reverse.join("\n").monsters ||
	grid).tap { puts _1,_1.count('#') }
__END__

grid.length.times do |y|
	grid[y].length.times do |x|
		if grid[y][x] == '#'
			(grid[y][x+17] &&= '?') rescue nil
			p [x, y]
		end
	end
end

puts grid
__END__
require 'matrix'
grid = Matrix[*grid1.split("\n").map { _1.chars.map(&'O'.method(:==)) }]
def fix(grid)
	grid.each_with_index do |c, x, y|
		next unless c
		coords = 
			[
				# *[1,4,7,10,13,16].map { [x+_1, y-1] },
				# *[0,5,6,11,12,17,18,19].map { [x+_1, y] },
				[x+17,y-1]
			]
		next unless coords.all? { grid[_1, _2] }
		coords.each { grid[_1, _2] = false }
	rescue
		die
	end
end

p grid.count(&:itself)
fix grid
p grid.count(&:itself)

                  #  
#    ##    ##    ### 
 #  #  #  #  #  #
# 01234567890123456789
	# p [i, j]
# end
__END__
exit
MONSTER=%{\
..................#..
#....##....##....###.
.#..#..#..#..#..#

until grid.empty?
	grid.gsub! MONSTER, ''

puts grid

# p neighbors.keys.map(&:real).minmax

# p neighbors.values.map(&:name)
# p neighbors.length

# p ""
# p $tiles.map { _1 }
# exit
# grid = { [0, 0] => fst }
# neighbors.values.map { puts _1 ; puts }
# $tiles.first.neighbors.each { puts _1; puts }

# y = TILES.values.find { fst.n == _1.s }
# puts fst.perms
