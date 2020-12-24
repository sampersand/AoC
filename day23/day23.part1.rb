$stdin=open("day23.txt")
$stdin=DATA
CUPS=gets.chomp.chars.map(&:to_i)

Node = Struct.new :num, :next do
	include Comparable
	include Enumerable
	alias to_i num
	def skip!(n)
		ret, self.next = self.next.first(3), n.succ.times.reduce(self) { _1.next }
		ret
	end

	def <=>(rhs) 
		to_i <=> rhs.to_i
	end

	def inspect
		"Node(#{num}, next=#{self.next&.num.inspect})"
	end

	def each
		return to_enum __method__ unless block_given?
		n = self
		loop do
			yield n
			break if self == (n = n.next)
		end
	end
	def to_a; each.to_a end
end

max = []
NODES=[nil]*CUPS.length

first = last = nil
head = CUPS.reverse.reduce(nil) do |acc, num|
	NODES[num] = node = Node.new num, acc
	first ||= node
	last = node
end

first.next = last
len_enum = (NODES.length - 1).downto 1

100.times do
	pickup = head.skip!(3)

	dst =
		(head.to_i - 1)
			.downto(1)
			.chain(len_enum)
			.lazy
			.filter_map { NODES[_1] }
			.find { !pickup.include? _1 }

	dst.next, pickup.last.next = pickup.first, dst.next
	head = head.next
end

p NODES[1].map(&:to_i)[1..].join


__END__
389125467



