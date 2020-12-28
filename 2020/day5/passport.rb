# I Wrote this in anticipation of further use of day 4. It's useless now, and i just left it
# here for posterity.
class Passport < Hash
	def initialize(x)
		merge! x.to_h
	end

	%i(byr iyr eyr hgt hcl ecl pid cid).each do |key|
		define_method key do self[key.to_s] end
	end

	def byr?
		byr&.match?(/\A\d{4}\z/) && (1920..2002).include?(byr.to_i)
	end

	def byr!
		byr? ? byr : raise(ArgumentError, "invalid 'byr': #{byr.inspect}") 
	end

	def iyr?
		iyr&.match?(/\A\d{4}\z/) && (2020..2030).include?(iyr.to_i)
	end

	def iyr!
		iyr? ? iyr : raise(ArgumentError, "invalid 'iyr': #{iyr.inspect}") 
	end

	def eyr?
		eyr&.match?(/\A\d{4}\z/) && (2020..2030).include?(eyr.to_i)
	end

	def eyr!
		eyr? ? eyr : raise(ArgumentError, "invalid 'eyr': #{eyr.inspect}") 
	end

	def hgt?
		hgt =~ /\A(\d+)(cm|in)\z/ && ($2 == 'cm' ? 150..193 : 59..76).include?($1.to_i)
	end

	def hgt!
		hgt? ? hgt : raise(ArgumentError, "invalid 'hgt': #{hgt.inspect}") 
	end

	def hcl?
		hcl&.match? /\A#\h{6}\z/
	end

	def hcl!
		hcl? ? hcl : raise(ArgumentError, "invalid 'hcl': #{hcl.inspect}") 
	end

	def ecl
		%w(amb blu brn gry grn hzl oth).include? ecl
	end

	def ecl!
		ecl? ? ecl : raise(ArgumentError, "invalid 'ecl': #{ecl.inspect}") 
	end

	def pid?
		%w(amb blu brn gry grn hzl oth).include? pid
	end

	def pid!
		pid? ? pid : raise(ArgumentError, "invalid 'pid': #{pid.inspect}") 
	end

	alias cid? cid
	alias cid! cid
end

open('../day4/day4.txt')
	.each_line
	.map(&:chomp)
	.map { Passport.new(_1.split(/[:\s]/).each_slice(2)) }
	.select(&:byr?)
	.select(&:iyr?)
	# .select(&:eyr?)
	# .select(&:hgt?)
	# .select(&:hcl?)
	# .select(&:pid?)
	# .select(&:ecl?)
	.count
	.tap { puts "Part 2: #{_1}" }

__END__
# Here's the un-cleaned-up code I used 
open('day4.txt')
	.each_line
	.map(&:chomp)
	.chunk_while { !_2.empty? }
	.map { _1.reject(&:empty?) }
	.map { _1.join(' ').split(/[: ]/).each_slice(2).to_h }
	.each { _1.delete 'cid' }
	.select { (1920..2002).include? _1['byr'].to_i }
	.select { (2010..2020).include? _1['iyr'].to_i }
	.select { (2020..2030).include? _1['eyr'].to_i }
	.select { _1['hgt'] =~ /^(\d+)(cm|in)$/ and ($2 == 'cm' ? 150..193 : 59..76).include? $1.to_i }
	.select { _1['hcl'] =~ /^#\h{6}$/ }
	.select { %w(amb blu brn gry grn hzl oth).include? _1['ecl'] }
	.select { _1['pid'] =~ /^\d{9}$/ }
	.count
	.display
