$grid = Set.new

File.read('input.txt')
  .lines(chomp: true)
  .each_with_index do |line, x|
    line.each_char.with_index do |char, y|
      $grid << x+y.i if char == '@'
    end
  end

S=[*-1..1].product([*-1..1]).map {_1+_2.i}.reject(&:zero?)
# S=[-1-1i,-1,-1+1i,-1i,1i,1-1i,1,1+1i]

def n(key)
  S.map{ key + it }.count { $grid.include? it }
end

part2 = part2 = 0
begin
  r = $grid.select { n(it) < 4 }

  part1 = r.count if part1.zero?
  part2 += r.count

  old_length = $grid.length
  $grid -= r
end while old_length != $grid.length

fail unless part2 == 8277
fail unless part1 == 1349
p [part1, part2]
