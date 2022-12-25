require 'set'
$stdin = open 'day17.txt'
# $stdin = DATA

jets = $stdin.read.chomp.bytes.map { _1 - ?=.ord }

def disp_imag(n)
  list = []
  n.each do |l| (list[l.imag] ||= [])[l.real] = '#' end
  list.each { |x| x.map! { _1 || '.' } }
  puts list.map(&:join)
end

ROCKS = [
  Set[0, 1, 2, 3],
  Set[1, 0+1i, 1+1i, 2+1i, 1+2i],
  Set[2, 2+1i, 2i, 1+2i, 2+2i],
  Set[0, 1i, 2i, 3i, 4i],
  Set[0, 1, 1i, 1+1i],
]

class Grid
  def initialize; @grid = [] end
  def [](row) = @grid[row] ||= []
  def each(&block) = @grid.each(&block)
  def map(&block) = @grid.map(&block)

  def add(rock)
    start = 

  def to_s
    @grid.each_with_index.map do |row, idx|
      "%-2d" % idx + row.map { _1 ? '#' : '.' }.join
    end.join("\n") + "\n  01234567"
  end
end
grid = Grid.new
grid[0].replace 8.times.to_a

ROCKS.cycle.first(10).each do |rock|
  grid.add rock
end

puts grid
# ROCKS.each { disp_imag _1; puts }
# disp_imag ROCKS[4]
