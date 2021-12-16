$stdin = open('day15.txt')
$stdin = DATA

$input={}
$stdin.each_line.each_with_index do |line, x|
  line.chomp.each_char.each_with_index do |c, i|
    $input[x + i.i] = c.to_i
  end
end

$risks = [$input.to_a.last].to_h

def neighbors(x)
  [x+1,x-1,x+1i,x-1i].select(&$input)
end


def solve(start, visited=[])
  $risks[start] ||= begin
    p start
    ne = neighbors(start) - visited
    v2 = visited + ne + [start]

    $input[start] + ne.map { solve _1, v2 }.min
  end
end

p solve(0+0i) - $input.first[1]
p 
__END__
1163751742
1381373672
2136511328
3694931569
7463417111
1319128137
1359912421
3125421639
1293138521
2311944581
