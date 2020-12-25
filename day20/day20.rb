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

# Parse tiles from the input file
$/ = "" # paragraph mode!

TILES =
	open("day20.txt").map(&:chomp).map { |paragraph|
		name, *lines = paragraph.split("\n")

		Tile.new name[/\d+/].to_i, lines.map(&:chars)
	}.to_set

# Construct the grid of tiles and their neighbors.
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

make_grid TILES.first.tap(&:init_perm!) # we have to chose one of them as a starting point.

# Create a set of only elements present within the board.
BOARD =
	NEIGHBORS.flat_map do |tilecoord, tile|
		inner = tile.inner

		8.times.to_a.product(8.times.to_a)
			.filter_map { |x, y| inner[y][x] == '#' and tilecoord + x + y.i }
	end.to_set

# The offsets that monsters can be at
MONSTER = [
                                                               18-1i, 
0+0i,        5+0i, 6+0i,         11+0i, 12+0i,          17+0i, 18+0i, 19+0i,
  1+1i,    4+1i,      7+1i,    10+1i,      13+1i,    16+1i,
]

# For all the different rotations/translations of `MONSTER`, delete sea monsters in the first
# permutation that matches.
8.times do |perm|
	monster_mask = MONSTER.map { _1.send(perm >= 4 ? :conj : :itself) * 1i ** perm }

	found = false
	BOARD.each do |z|
		coords = monster_mask.map { z + _1 }
		next unless coords.all? { BOARD.include? _1 }

		coords.each { BOARD.delete _1 }
		found = true
	end

	break if found
end

# Get the corners
part1 =
	NEIGHBORS.keys.map(&:real).minmax
		.product(NEIGHBORS.keys.map(&:imag).minmax)
		.map { NEIGHBORS[_1 + _2.i].name }
		.reduce(&:*)

# Print the results.
puts "Part 1: #{part1}"
puts "Part 2: #{BOARD.length}"
