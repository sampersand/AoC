mask = nil
mem1 = {}
mem2 = {}

open("day14.txt").each do |line|
	case line.chomp
	when /mask = / then mask = $'.chars 
	when /mem\[(\d+)\] = /
		mem1[$1.to_i] = ('%036b' % $'.to_i)
			.chars
			.zip(mask)
			.map { _2 == 'X' ? _1 : _2 }
			.join
			.to_i(2)

		addr = ('%036b' % $1.to_i)
			.chars
			.zip(mask)
			.map { _2 == 'X' ? '%c' : _2 == '1' ? _2 : _1 }
			.join

		(1 << addr.count('%')).times.each do |n|
			mem2[sprintf(addr, *('%036b' % n).bytes.reverse).to_i(2)] = $'.to_i
		end
	else fail "Bad line: #{line}"
	end
end

puts "Part 1: #{mem1.values.sum}"
puts "Part 2: #{mem2.values.sum}"
