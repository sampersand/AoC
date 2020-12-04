# HEEEY Leaderboard 72
Io.File('day4.txt')
	.lines()
	
	# .chunk_while { !_2.empty? }
	# .map { _1.reject(&:empty?) }
	# .map { _1.join(' ').split(/[: ]/).each_slice(2).to_h }
	# .each { _1.delete 'cid' }
	# .tap { |stream|
	# 	stream.map(&:keys)
	# 		.map(&:sort)
	# 		.map { %w(byr ecl eyr hcl hgt iyr pid) - _1 }
	# 		.count(&:empty?)
	# 		.tap { puts "Part 1: #{_1}" }
	# }
	# .select { (1920..2002).include? _1['byr'].to_i }
	# .select { (2010..2020).include? _1['iyr'].to_i }
	# .select { (2020..2030).include? _1['eyr'].to_i }
	# .select { _1['hgt'] =~ /(\d+)(cm|in)/ and ($2 == 'cm' ? 150..193 : 59..76).include? $1.to_i }
	# .select { _1['hcl']&.match? /#\h{6}/ }
	# .select { %w(amb blu brn gry grn hzl oth).include? _1['ecl'] }
	# .select { _1['pid']&.match? /\d{9}/ }
	# .count
	# .tap { puts "Part 2: #{_1}" }
