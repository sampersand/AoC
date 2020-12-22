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
				SQUARES[edge].push([name, TILES[name].length])
			end
		end
end

edges =
	TILES.select { |name, _|
		SQUARES.map { |_, tiles| tiles.map(&:first).uniq.-([name]).length }
			.flatten.count(0) == 4
}
p edges.keys.reduce(&:*)
