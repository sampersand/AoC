# Read entire input, adding all `(x,yi)` pairs to the grid
$grid = Set.new
File.read('input.txt')
  .lines(chomp: true)
  .each_with_index do |line, x|
    line.each_char.with_index do |char, y|
      $grid << Complex(x, y) if char == '@'
    end
  end

# An array of all 8 surrounding neighbors
SURROUNDING = [*-1..1].product([*-1..1])
  .map { Complex(_1, _2) }
  .reject(&:zero?)

# Find all the neighbors surrounding `key`
def neighbors(key)
  SURROUNDING.map{ key + it }.count { $grid.include? it }
end

part1 = part2 = 0
begin # `begin ... end while ...` is a `do while`
  # Find which ones are removable
  removable = $grid.select { neighbors(it) < 4 }

  part1 = removable.count if part1.zero? # Part 1 is only the first removable things
  part2 += removable.count # part2 accrues over time

  old_length = $grid.length # keep old length for check
  $grid -= removable  # remove dups
end while old_length != $grid.length

p [part1, part2]
