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

# right about here's where i said "screw it, i just want to get the answer."
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
	# prepend the unicode chracter `\u01` + `"%02x % index` before every character to ensure unique indices
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
	grid).tap { puts _1.count('#') }
