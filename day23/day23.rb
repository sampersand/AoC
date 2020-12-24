$stdin=open("day23.txt")
$stdin=DATA
CUPS = gets.chomp.chars.map(&:to_i)
CUPS.concat CUPS.length.upto(1e6).to_a

# Nodes is an array that we can index into to find each cup corresponding
# to each label.
NODES = Array.new 0, CUPS.length

Node = Struct.new :num, :next

# Setup `NODES`, and set `head` to the first node.
first = last = nil
head = CUPS.reverse.reduce(nil) do |acc, num|
	NODES[num] = last = Node.new num, acc
	first ||= last
	last
end
first.next = last # complete the cycle

10000000.times do
	pickup = [n = head.next, n = n.next, n = n.next]
	head.next = n.next

	dst =
		(head.num - 1)
			.downto(1)
			.chain(999_999.downto(1))
			.find { !pickup.include? NODES[_1] }
			.then { NODES[_1] }

	dst.next, pickup.last.next = pickup.first, dst.next
	head = head.next
end

p NODES[1].num, NODES[1].next.num, NODES[1].next.next.num, NODES[1].next.next.next.num


__END__
389125467



