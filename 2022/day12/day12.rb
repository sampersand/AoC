require 'set'
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
    .select { GRID[_1] <= GRID[z]+1 rescue nil }
end

def traverse(position, memo={STOP => 0}, visited=[])
  $memo ||= memo
  memo[position] ||= begin
    memo[position] = nil
    m=moveable(position, visited)
    m.each do |key|
      memo[key] ||= nil
    end

    visited.append position, *m
    m.filter_map{ 1 + traverse(_1, memo, visited) }.min || Float::INFINITY
  end
end

p traverse start
__END__
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
