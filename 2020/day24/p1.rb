tiles = Hash.new(false)
open('day24.txt').each_line do |line|
# DATA.each_line do |line|
	line.chomp!
	x = 0
	y = 0
	until line.empty?
		case
		when line.slice!(/^e/) then x += 2
		when line.slice!(/^w/) then x -= 2
		when line.slice!(/^se/) then x += 1; y -= 1
		when line.slice!(/^sw/) then x -= 1; y -= 1
		when line.slice!(/^ne/) then x += 1; y += 1
		when line.slice!(/^nw/) then x -= 1; y += 1
		end
	end
	tiles[[x, y]] ^= true
end
p tiles.values.select(&:itself).length
p tiles.length

# p tiles
		# e, se, sw, w, nw, and ne
=begin

  x
 / \ /
x - x - x
 \ / \ / \
- x - x - x
 / \ / \


=end
__END__
nwwswee
