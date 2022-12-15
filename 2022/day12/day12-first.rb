require_relative '../submitter'
# data = download! 2022, 12
$stdin = open 'day12.txt'

GRID = {}
start = nil
stop = nil

$stdin.each_with_index do |line, x|
  line.chomp.each_char.with_index do |chr, y|
    z = x + y.i
    GRID[z] = case chr
              when 'S' then start = z; 'a'
              when 'E' then stop  = z; 'z'
              else                     chr
              end.ord
  end
end
STOP = stop

def moveable(z, visited)
  [1i,-1i,1,-1].map{z+_1}
    .reject { visited.include? _1}
    .select { ('a'.ord..GRID[z]+1).include? GRID[_1] }
end

def traverse(position, visited=[], memo={STOP => 0})
  memo[position] ||= begin
    visited += [position, *m=moveable(position, visited)]
    m.filter_map{ |z|
      1 + traverse(z, visited, memo) rescue nil
    }.min
  end
end

p traverse start
