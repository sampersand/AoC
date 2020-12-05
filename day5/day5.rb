$/="";
open('../day4/day4.txt')
	.each_line
	.map(&:chomp)
	.map { _1.split(/[:\s]/).each_slice(2).to_h }
	.each { _1.delete 'cid' }
	.select { ('1920'..'2002').include? _1['byr'] }
	.select { ('2010'..'2020').include? _1['iyr'] }
	.select { ('2020'..'2030').include? _1['eyr'] }
	.select { _1['hgt'] =~ /(\d+)(cm|in)/ and ($2 == 'cm' ? 150..193 : 59..76).include? $1.to_i }
	.select { _1['hcl'] =~ /#\h{6}/ }
	.select { %w(amb blu brn gry grn hzl oth).include? _1['ecl'] }
	.select { _1['pid'] =~ /\d{9}/ }
	.count
	.tap { puts "Part 2: #{_1}" }
