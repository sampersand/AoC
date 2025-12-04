GRID = {}
input = File.read('input.txt')
  .lines(chomp: true)
  .each_with_index do |line, x|
    line.chars.each_with_index do |char, y|
      GRID[x+y.i] = 1 if char == '@'
    end
  end

def neighbors(key)
  [*-1..1].product([*-1..1])
    .reject { _1 == _2 && _1 == 0 }
    .map { key + (_1 + _2.i) }
    .select(&GRID)
end

total = 0
loop do
  removalable = GRID.select do |key,|
    neighbors(key).count < 4
  end
  total += removalable.count
  old = GRID.length
  GRID.delete_if { _2; removalable.keys.include? _1 }
  new = GRID.length
  if old == new ; break end
end

p total
