$stdin=open('day4.txt') # omit if reading from stdin

require 'set'
$/="" # paragraph mode is OP

numbers = gets.split(',').map(&:to_i)
grids = $stdin.map { |line|
  grid = line.split("\n").map { _1.split.map(&:to_i) }
  [*grid, *grid.transpose].map(&:to_set)
}

part1 = nil
nums = Set.new
numbers.each do |n|
  nums.add n

  grids.reject! do |g|
    next if g.none? { nums >= _1 }

    score = n * (g.reduce(&:|)-nums).sum
    puts "part2: #{score}" if grids.one?
    puts "part1: #{score}" unless part1

    part1 = true
  end
end
