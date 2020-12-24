require 'set'
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
		# @permutation
	end

	def n(b); b.first end
	def s(b); b.last end
	def e(b); b.map(&:last) end
	def w(b); b.map(&:first) end

	def permute(edge, tile_is_of_self)
		permutation = (permutations.find { edge == public_send(tile_is_of_self, _1) } or return).freeze
		if defined? @permutation and @permutation != permutation
			fail
		end
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

def make_grid(tile, neighbors, x=0, y=0)
	neighbors[[x, y]] || !tile and return
	neighbors[[x, y]] = tile
	nbrs = tile.neighbors

	make_grid nbrs[0], neighbors, x, y-1
	make_grid nbrs[1], neighbors, x, y+1
	make_grid nbrs[2], neighbors, x+1, y
	make_grid nbrs[3], neighbors, x-1, y
end

# puts f.neighbors[0].neighbors[0]
# puts
# f.neighbors
# puts "--"
# puts f.neighbors.map { "#{_1}\n\n"}
# puts f

# __END__
make_grid $tiles.first.tap(&:init_perm!), neighbors = {}
min = neighbors.keys.min

ary = (min[1]..min[1]+11).map do |y|
	(min[0]..min[0]+11).map do |x|
		neighbors[[x, y]]
	end
end

# puts ary[0].map { _1.inner.map(&:join) }.reduce { |l,r|l.zip(r).map { _1 + '|' + _2 } }
# puts '-'*131
# puts ary[1].map { _1.inner.map(&:join) }.reduce { |l,r|l.zip(r).map { _1 + '|' + _2 } }

# __END__

# puts ary.first.map { "#{_1}\n\n"}
# # puts neighbors[min]
# # puts neighbors[[min[0]+1, min[0]]]
# exit
# # puts neighbors[[1,0]]
# # puts neighbors[[2,0]]
# # exit
# # # p neighbors.map(&:reverse).to_h[neighbors[[0,0]].neighbors[0]]#.neighbors.map {"#{_1}\n\n"}
# # # puts neighbors[[0,0]]
# # # puts neighbors[[0,1]]
# # exit
# ary = Array.new(12){ Array.new(12, nil) }
# neighbors.each do |key, tile|
# 	# p [[key[0] + min[0]],[key[1] + min[1]]]
# 	ary[key[0] + min[0]][key[1] + min[1]] = tile
# end

# puts ary.map(&:first)

# exit

grid = ary.map { |l| l.reduce( Array.new(8){""} ) { |a, r|
	a.zip(r.inner.map(&:join)).map { _1 + _2 }  }.join("\n") }.join("\n")

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
