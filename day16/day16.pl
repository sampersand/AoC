$/=''
$stdin = open("day16.txt")
rules = gets.split("\n")
	.map {
		/([^:]+): (\d+)-(\d+) or (\d+)-(\d+)/ =~ _1
		lower = $2.to_i..$3.to_i
		upper = $4.to_i..$5.to_i
		[$1, proc { |l| lower.include?(l) || upper.include?(l)}]
	}.to_h

mine = gets.split("\n").last.split(',').map(&:to_i)
nearby =
	gets.split("\n")
		.drop(1)
		.map { _1.split(',').map(&:to_i) }
		.tap {}
		.select { |ticket| ticket.none? { |field| rules.values.none? { _1.call(field) } } }
		.transpose

rules
	.transform_values { |rng|
		nearby.each_with_index.filter_map { _1.all?(&rng) and _2 }
	}
	.sort_by { _2.length }
	.reduce({}) { |(acc, *rest), (key, vals)|
		acc[val = (vals - rest).first] = key
		[acc, *rest, val]
	}.first
	.filter_map { _2.start_with? 'departure' and _1 }
	.map { mine[_1] }
	.reduce(&:*)
	.tap { puts "Part 2: #{_1}" }
