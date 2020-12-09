ARY = DATA.map(&:to_i)

N = ARY
	.each_cons(6)
	.find { |*a, l| a.combination(2).map(&:sum).none? l }
	.last

puts N

2.upto(ARY.length)
	.lazy
	.filter_map { |n| ARY.each_cons(n).find { _1.sum == N } }
	.first
	.minmax
	.sum
	.display
__END__
35
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
