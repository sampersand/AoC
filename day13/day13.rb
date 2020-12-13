x = DATA.each_line
early = x.next.to_i
times = x.next.tr('x','1').split(',').map(&:to_i)

times.grep_v(1)
	.map { [(early / _1 + 1) * _1, _1] }
	.min
	.tap { puts "Part 1: #{(_1 - early) * _2}" }

sorted = times.each_with_index.sort.reverse

idx = sorted.map(&:last)
num = sorted.map(&:first)

curr = -idx[0] % num[0]
acc = num[0]

(1...num.length).each do |i|
	curr += acc until curr % num[i] == -idx[i] % num[i]
	acc *= num[i]
end

puts "Part 2: #{curr}"

__END__
1000390
23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,383,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,19,x,x,x,x,x,x,x,x,x,29,x,503,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,37
