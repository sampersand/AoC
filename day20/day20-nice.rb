require 'set'

class Array
	alias n first
	alias s last
	def e; map(&:last) end
	def w; map(&:first) end
end

class Tile #< Array
	attr_reader :name, :board

	def initialize(name, board) @name, @board = name, board end

	def init_perm!
		@permutation = permutations.first
	end

	def permutations
		@permutations ||=
			[@board, @board.transpose]
				.flat_map { 
					[_1, _1.reverse, _1.map(&:reverse), _1.reverse.map(&:reverse)]
				}
	end

	def inner
		@permutation[1..-2].map { _1[1..-2] }
	end

	def permute(edge, dir)
		@permutation = permutations.find { edge == _1.send(dir) } || return
	end

	def neighbors
		@neighbors ||= begin
			t = $tiles.-([self])
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

	make_grid nbrs[0], neighbors, x, y-8
	make_grid nbrs[1], neighbors, x, y+8
	make_grid nbrs[2], neighbors, x+8, y
	make_grid nbrs[3], neighbors, x-8, y
end

make_grid $tiles.first.tap(&:init_perm!), neighbors = {}

board = Set.new

neighbors.each do |(tx, ty), tile|
	tile.inner.each_with_index do |row, ey|
		row.each_with_index do |ele, ex|
			board.add ex + tx + (ey + ty).i if ele == '#'
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
	neighbors.keys.map(&:first).minmax
		.product(neighbors.keys.map(&:last).minmax)
		.map { neighbors[_1].name }
		.reduce(&:*)

puts "Part 1: #{part1}"
puts "Part 2: #{board.length}"
