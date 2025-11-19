class Complex
  def taxi(rhs = 0i) = (self-rhs).rect.sum(&:abs)
end

module Enumerable
  alias eachi each_with_index
  def each_2d_coord
    return to_enum __method__ unless block_given?

    each_with_index do |row, y|
      row.each_with_index do |ele, x|
        yield x + y.i, ele
      end
    end
  end
end

class String

  def to_matrix(method = :chars) = lines(chomp: true).map(&method).each_2d_coord
  def transpose(method = :chars) = lines(chomp: true).map(&method).transpose.map(&:join).join("\n")
  def transpose!(...) = transpose(...).then { _1 == self ? nil : replace(_1) }
end

$stdin = open 'input.txt'
# $stdin = DATA
SRC=$stdin.read
galaxies = []
y = 0
SRC.lines(chomp: true).each do |line|
  y += 1
  (y += 1_000_001; next) unless line.match? /[^\.]/
  x = 0
  line.chars.eachi do |chr, q|
    x += 1
    (x += 1_000_001; next) if SRC.lines.map { _1[q] }.all? '.'
    galaxies << x + y.i unless chr == '.'
  end
end
p galaxies

# 2.times do
#   SRC.tap(&:transpose!).gsub! /^\.+$/, "\\&\n\\&"
# end

# galaxies = SRC.to_matrix.filter_map { _2 != '.' and _1 }
p galaxies.product(galaxies).sum { _1.taxi _2 } / 2 - 164
__END__
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
