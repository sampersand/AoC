x = DATA.each_line
early = x.next.to_i
times = x.next.tr('x','1').split(',').map(&:to_i)

=begin part 1
times.grep_v(1).map { [(early / _1 + 1) * _1, _1] }
	.min
	.tap { puts "Part 1: #{(_1 - early) * _2}" }
=end


sorted = times.each_with_index.sort.reverse
# sorted.delete_if { |x,_| x == 1 }

idx = sorted.map(&:last)
num = sorted.map(&:first)

curr = (num[0] - idx[0]) % num[0]
acc = num[0]

(1...num.length).each do |i|
	(curr += acc; puts (num[i] - idx[i]) % num[i] )until (curr % num[i]) == -idx[i] % num[i]
	acc = num[i].lcm acc
end
puts curr
# curr += acc until curr % n[1] == a[1]; acc *= n[1]
# curr += acc until curr % n[2] == a[2]; acc *= n[2]
# curr += acc until curr % n[3] == a[3]; acc *= n[3]
# curr += acc until curr % n[4] == a[4]; acc *= n[4]
p curr
exit
curr = sorted[0][1]
mul=sorted[0][0]
curr += mul until (curr % sorted[1][0] == sorted[1][1]); p [curr, sorted[1]]; mul *= sorted[1][0]
curr += mul until (curr % sorted[2][0] == sorted[2][1]); p [curr, sorted[2]]; mul *= sorted[2][0]
curr += mul until (curr % sorted[3][0] == sorted[3][1]); p [curr, sorted[3]]; mul *= sorted[3][0]
curr += mul until (curr % sorted[4][0] == sorted[4][1]); p [curr, sorted[4]]; mul *= sorted[4][0]
# curr += sorted[4][0] until (curr % sorted[5][0] == sorted[5][1]) || ($x||=0;$x+=1;$x>1000&&exit)
p curr

# start = IDX
# 1..1068785 do |x|
# 	start += 

=begin
# at_exit { p $n }

# sorted.map! { [_1, _2 - IDX] }
# found = 1068785
# sorted.each do |number, index|
# 	# printf "[%2d] %2d %2d %2d\n", index, number, found % number, (index + found) % number
# 	# p [index, found % number, (found + index) % number]
# 	# p [-index % number == found % number]
# 	p [-index % number == found % number]
# end

sorted = times.sort.reverse
found = 1068781
prod = times.reduce(&:*)
times.each_with_index do |number, index|
	# p [-index % number == found % number, -index, number]
	# p [(found+index) % number, -index, number]
end
p [found % prod, prod]
p [found % prod
# 818510110574689
exit;
=begin

(found + idx_n) == 0 (mod bus_n)
-index % number == found % number

# n = 317312821123
n = times.reduce(&:*)
(1068780..1068782).each do |n|
	if x = sorted.find { !((n - IDX + _2) % _1).zero? }
		n *= x.first
	else
		puts "works: #{n - IDX}"
		exit
	end
end
=end
# start = times.ma

# (100000000000000..).each do |n|

# 	if sorted.all? { ((start + _2) % _1).zero? } 
# 		puts "works: #{start}"
# 		exit
# 	end
# end
# 	end
# end
p "nope"

__END__
1000390
23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,383,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,19,x,x,x,x,x,x,x,x,x,29,x,503,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37
