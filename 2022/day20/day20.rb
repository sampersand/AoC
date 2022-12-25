# require_relative '../submitter'
# download! 2022, 20
$stdin = open 'day20.txt'
$stdin = DATA

Node = Struct.new(:num, :next, :prev) {
  def inspect = "Node(#{num})"
  def data_s
    x = []
    q = self
    begin
      x << q.num
      q = q.next
    end until q.equal? self
    # p x.inspect
    x.inspect
    # exit
    # x.map(&:inspect).to_s
  end
}

data = $stdin.map { Node.new _1.to_i }
data.each_cons(2) { _1.next = _2; _2.prev = _1 }
data[0].prev = data[-1]
data[-1].next = data[0]

data.each do |element|
  which = element.num.positive? ? :next : :prev
  target = element
  element.num.abs.times do
    target = target.send which
  end
  next if element.num.zero?

  element.prev.next = element.next
  element.next.prev = element.prev

  element.prev = target
  element.next = target.next
  target.next = element
  element.next.prev = element
puts data[0].data_s

end
exit



__END__
1
2
-3
3
-2
0
4
