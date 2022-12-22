$stdin = open 'day13.txt'

class Integer
  alias old_cmp <=>
  def <=>(rhs) = old_cmp(rhs) || [self] <=> rhs
end

class Array
  include Comparable
  alias old_cmp <=>
  def <=>(rhs) = old_cmp Array rhs
end

LINES = $stdin
  .each_line("\n\n")
  .flat_map { |line| line.split.map { eval _1 } }

puts LINES
  .each_slice(2)
  .with_index
  .sum { _1[0] < _1[1] ? _2 + 1 : 0 }

LINES.append([[2]], [[6]]).sort!

puts LINES.index([[2]]).succ * LINES.index([[6]]).succ
