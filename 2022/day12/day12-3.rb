require 'set'
$stdin =  open 'day12.txt'

GRID = {}
start = nil
$stop = nil

$stdin.each_with_index do |line, x|
  line.chomp.each_char.with_index do |chr, y|
    z = x + y.i
    GRID[z] = case chr
              when 'S' then start = z; 'a'
              when 'E' then $stop = z; 'z'
              else                     chr
              end.ord
  end
end

def moveable(z,memo)
  [1i,-1i,1,-1].map{z+_1}
    .reject { memo.key? _1 and _1 != $stop }
    .select { GRID[_1] <= GRID[z]+1 rescue nil }
end

def traverse(position, memo={$stop=>0})
  memo[position] ||= begin
    moveable(position, memo)
      .each{memo[_1]||=nil}
      .filter_map{ 1 + traverse(_1, memo) }.min || Float::INFINITY
  end
end

p traverse start
__END__
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
