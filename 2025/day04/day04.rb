$grid = Set.new

File.read('input.txt')
  .lines(chomp: true)
  .each_with_index do |line, x|
    line.each_char.with_index do |char, y|
      $grid << Complex(x, y) if char == '@'
    end
  end

SURROUNDING = [*-1..1].product([*-1..1])
  .map { Complex(_1, _2) }
  .reject(&:zero?)

def neighbors(key)
  SURROUNDING.map{ key + it }.count { $grid.include? it }
end

part1 = part2 = 0
begin
  removable = $grid.select { neighbors(it) < 4 }

  part1 = removable.count if part1.zero?
  part2 += removable.count

  old_length = $grid.length
  $grid -= removable
end while old_length != $grid.length

p [part1, part2]
