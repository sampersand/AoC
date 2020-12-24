require 'set'

$stdin = open('day24.txt')

tiles = Set.new

while gets
	$_.tap(&:chomp!)
		.gsub(/(?<![sn])[ew]/, '\&\&')
		.each_char
		.map { ('o' <=> _1).send(_1 =~ /[ew]/ ? :to_c : :i) }
		.sum
		.then { tiles.add? _1 or tiles.delete _1 }
end

puts "Part 1: #{tiles.length}"

100.times do 
	tiles
		.each_with_object(Hash.new 0) { |z, hash|
			[2, -2, 1+1i, 1-1i, -1+1i, -1-1i].each { hash[_1 + z] += 1 }
		}
		.filter_map { _2 == 2 || tiles.include?(_1) && _2 == 1 and _1 }
		.then { tiles.replace _1 }
end

	puts "Part 2: #{tiles.length}"

fail unless tiles.length == 3733
