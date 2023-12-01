require_relative '../utils/grid'
using Aoc
$stdin = DATA # open 'day8.txt'

grid = Aoc::Grid.from_enum $stdin.lazy.map { _1.chomp.chars.map(&:to_i) }
m = 0
# puts grid.rough_to_s
# p grid.to_a
# p grid.x_range
# p grid.y_range
# exit
grid.each do |key, coord|
  amnt = [0,0,0,0]
  # next unless coord == Aoc::Position[1, 2]

  last_tree = 0
  (1..).each do |x|
    t = grid[coord - x.x] or break
    amnt[0] += 1
    break if last_tree >= t
    last_tree = t
  end

  last_tree = 0
  (1..).each do |x|
    t = grid[coord + x.x] or break
    amnt[1] += 1
    break if last_tree >= t
    last_tree = t
  end

  last_tree = 0
  (1..).each do |x|
    t = grid[coord - x.y] or break
    amnt[2] += 1
    break if last_tree >= t
    last_tree = t
  end

  last_tree = 0
  (1..).each do |x|
    t = grid[coord + x.y] or break
    amnt[3] += 1
    break if last_tree >= t
    last_tree = t
  end
  p [amnt.reduce(:*), coord, amnt, key]
  m = [amnt.reduce(:*), m].max
end
p m
# fail unless m == 735

# p grid.positions
# puts grid.rough_to_s
__END__
30373
25512
65332
33549
35390
