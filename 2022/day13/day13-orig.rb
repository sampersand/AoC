require_relative '../submitter'
$stdin = open 'day13.txt'

class Integer
  alias old_cmp <=>
  def <=>(rhs) = rhs.is_a?(Array) ? [self] <=> rhs : old_cmp(rhs)
end

class Array
  alias old_cmp <=>
  def <=>(rhs) = rhs.is_a?(Array) ? old_cmp(rhs) : old_cmp([rhs])
end
count = []

i = 0
$stdin.each_line("\n\n", chomp: true) do |line|
  i += 1
  first, second = line.split.map { eval _1 }
  count << i if (first <=> second) < 0
end
p count.sum

__END__
[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]
