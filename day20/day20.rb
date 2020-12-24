$/=""

SQUARES = Hash.new { |h, k| h[k] = [] }
TILES={}

open("day20.txt").map(&:chomp).each do |l|
	name, *lines = l.split("\n")
	name = name[/\d+/].to_i
	lines = lines.map(&:chars)

	[lines, lines.transpose]
		.map { [_1, _1.reverse, _1.map(&:reverse), _1.reverse.map(&:reverse)] }
		.flatten(1)
		.each do |tile|
			(TILES[name]||=[]).push tile
			[tile.first, tile.last, tile.map(&:first), tile.map(&:last) ].each do |edge|
				SQUARES[edge.join].push([name, TILES[name].length])
			end
		end
end

NEIGHBORS = {}
TILES.each do |name, perms|
	neighbors = SQUARES.select { _2.map(&:first).uniq.include?(name) }
		.transform_values { |v| v.reject { |n, _| n == name} }
		.values.map { _1.map(&:first) }.flatten.uniq
	NEIGHBORS[name] = neighbors
end

def shared_neighbor(n1, n2)
	NEIGHBORS[n1].find { NEIGHBORS[n2].include? _1 and _1 != n1 and _1 != n2 }
end

class Array; def pr; map(&:join).join("\n") end end

corner, (n1, n2) = NEIGHBORS.select { _2.length == 2 }.first

board = [[corner, n1], [n2]]
board[-1].push shared_neighbor(n1, n2)

loop do 
	x = NEIGHBORS.keys
			.product(NEIGHBORS.keys)
			.find { |l, r| shared_neighbor(board[-2][-1], l) == r && shared_neighbor(board[-1][-1], r) == l } \
			or break
	board[0].push x[0]
	board[1].push x[1]
	p board
end


p x
# 10.times do
# 	board
# end

def concat_rows(*row)
	acc = TILES[row.shift]
	until row.empty?
		acc = acc.product(TILES[row.shift])
			.find { |l, r| l.map { _1[-1] } == r.map { _1[0] } }
			.reduce { |l, r| l.zip(r).map { _1 + _2 } }#{ _1[..-2] + _2[1..] } }
	end
	acc
end

# puts concat_rows(corner, n1, x.first).map(&:join)
# puts concat_rows(n2, board[-1][-1]).map(&:join)
# 	row.each_cons
# # p TILES[x1].map{ _1.pr }
# puts TILES[x1].map { _1.map(&:join) }.product(TILES[x2].map { _1.map(&:join)}).to_a
# 	.find { |l,r| l.map { _1[-1] }  == r.map { _1[0] } }
# 	.reduce { |l, r| l.zip(r).map { _1[..-2] + _2[1..] }}
	# .map { |l, r| p l, r } # x, y = a.map { _1.map(&:join) }; p x, y ; exit.reduce(&:zip).join("\n") }# .join#.reduce(&:zip).map { |l, r| _1.join + _2.join + "\n" } }.join
	# .map { |x,y| p [x, y] }



# board.map! { }
# board.flatten!.map! { TILES[_1] }
# puts board.map { _1.(&:join).join("\n") }
# p board
# def assemble(tiles, so_far={})
# 	if tiles.empty?
# 		yield so_far
# 		return
# 	end

# 	(name, _), *tiles = tiles
# 	edges = SQUARES.select { _2.map(&:first).uniq.include? name }.values
# 	edges.each do |community|
# 		next if community.any? { |name, _| so_far[name] }
# 		permutations, neighbors = community.partition { _1[0] == name }
# 		permutations.map(&:last).each do |perm|
# 			assemble tiles, so_far.merge(name => perm) do |res|
# 				yield res
# 			end
# 		end
# 	end

# 	$names||=begin require 'set'; Set.new end
# 	$names.add? name and p $names
# end

# assemble TILES.to_a do |x|
# 	p x
# 	exit
# end

__END__
board = [[corner, n1], [n2, NEIGHBORS[n1].find { NEIGHBORS[_1].-([corner]).include? n2 }]]

# xxx
# xxx
100.times do
	p NEIGHBORS[board[-2].last].find { |x| NEIGHBORS[board[-1].last].any? { _1 == x }}
	p NEIGHBORS[board[-1].last]
	# n1 = p(NEIGHBORS[n1].select { NEIGHBORS[_1].include? n2 }.-([corner]))[0]
	exit
	# n1
	# exit
end
p row

# p neighbors

exit
__END__
def assemble(tiles, so_far=[nil])
	(name, perms), *tiles = tiles
	return if so_far.include?(name)
	edges = SQUARES.filter_map { (x=_2.map(&:first).uniq).include?(name) && [_1, x - [name]] }
	p edges
end

p assemble TILES.to_a


# start = 
# 	TILES.filter_map { |name, _|
# 		edges = SQUARES.filter_map { x=_2.map(&:first).uniq; x.include?(name) && [_1, x - [name]] } .to_h
# 		edges.map { _2.length }.count(0) == 4 or next
# 		p edges
# 		# p edges.select { _2.length == 2 }
# 		exit
# 		name
# }

# p edges
# .flatten.sort.count(0)
exit

fst, snd = tiles.to_a.first(2)
# p SQUARES
p SQUARES.select { |_, l| l.map(&:first).include?(fst) && l.map(&:first).include?(snd) }.length
exit
(l, li), (r, ri) = SQUARES.values.first.uniq(&:first)
puts tiles[l][li-1].map(&:join)
puts
puts tiles[r][ri-1].map(&:join)
p SQUARES.values.select { _1.empty? }.length

	# .map { x= _1.split("\n"); [x.shift[/\d+/], x.to_a.map { |l| l.chars.map {|x| x == '#'} }.then { |q| [*q] }]}
	# .to_h

# p lines.keys.shuffle.first(4).map(&:to_i).reduce(&:*)
__END__
things =
	lines.lazy
		.map { |l,r|[r, r.reverse, r.map(&:reverse), r.reverse.map(&:reverse)].map { [l, _1] } }

		# .map 
		.to_a.display

# 	.to_a.display
# # p lines.length ** 4
# # pp lines.first
# # pp lines
