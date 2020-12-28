require 'set'

START = Set.new
$stdin = open 'day17.txt'

while gets
	$_.chomp.chars.each_with_index do |chr, x|
		START.add [x, $., 0, 0] if chr == '#'
	end
end

2.times do |part|
	cube = START

	6.times do 
		hash = Hash.new 0

		cube.each do |x, y, z, w|
			[*x-1..x+1].product [*y-1..y+1], [*z-1..z+1], [*w-1..w+1] do |x2, y2, z2, w2|
				next if part.zero? && !w2.zero?
				hash[[x2, y2, z2, w2]] += 1
			end
		end

		cube = hash.filter_map { |k, v| v == 3 || cube.include?(k) && v == 4 and k }.to_set
	end

	puts "Part #{part}: #{cube.length}"
end
