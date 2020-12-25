require 'set'

class Array
	alias n first
	alias s last
	def e; map(&:last) end
	def w; map(&:first) end
end

Tile = Struct.new :name, :board do
	def init_perm!
		@permutation = permutations.first
	end

	def permutations
		@permutations ||=
			[board, board.transpose]
				.flat_map { [_1, _1.reverse, _1.map(&:reverse), _1.reverse.map(&:reverse)] }
	end

	def inner
		@permutation[1..-2].map { _1[1..-2] }
	end

	def permute(edge, dir)
		@permutation = permutations.find { edge == _1.send(dir) } || return
	end

	def neighbors
		@neighbors ||= begin
			t = TILES.-([self])
			[t.find { _1.permute(@permutation.n, :s) },
			 t.find { _1.permute(@permutation.s, :n) },
			 t.find { _1.permute(@permutation.e, :w) },
			 t.find { _1.permute(@permutation.w, :e) }]
		end
	end

	def to_s
		@permutation.map(&:join).join("\n")
	end
end

$/="" # paragraph mode!

TILES =
	open("day20.txt").map(&:chomp).map { |paragraph|
		name, *lines = paragraph.split("\n")

		Tile.new name[/\d+/].to_i, lines.map(&:chars)
	}.to_set


NEIGHBORS = {}

def make_grid(tile, z=0)
	return if NEIGHBORS[z]
	NEIGHBORS[z] = tile
	nbrs = tile.neighbors

	nbrs[0]&.tap { make_grid _1, z - 8i }
	nbrs[1]&.tap { make_grid _1, z + 8i }
	nbrs[2]&.tap { make_grid _1, z + 8  }
	nbrs[3]&.tap { make_grid _1, z - 8  }
end

make_grid TILES.first.tap(&:init_perm!)

board = Set.new

NEIGHBORS.each do |tilecoord, tile|
	tile.inner.each_with_index do |row, y|
		row.each_with_index do |ele, x|
			board.add tilecoord + x + y.i if ele == '#'
		end
	end
end


MONSTER = [
                                                               18-1i, 
0+0i,        5+0i, 6+0i, 	       11+0i, 12+0i,          17+0i, 18+0i, 19+0i,
  1+1i,    4+1i,      7+1i,    10+1i,      13+1i,    16+1i,
]

8.times do |perm|
	monster_mask = MONSTER.map { _1.send(perm >= 4 ? :conj : :itself) * 1i ** perm }

	board.each do |z|
		coords = monster_mask.map { z + _1 }
		coords.all? { board.include? _1 } and coords.each { board.delete _1 }
	end
end

part1 =
	NEIGHBORS.keys.map(&:real).minmax
		.product(NEIGHBORS.keys.map(&:imag).minmax)
		.map { NEIGHBORS[_1 + _2.i].name }
		.reduce(&:*)

puts "Part 1: #{part1}"
puts "Part 2: #{board.length}"
