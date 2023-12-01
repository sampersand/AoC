$stdin = open('day15.txt')
$stdin = DATA

# REad the input into a hash of complex indicies
INPUT={}
$stdin.each_line.each_with_index do |line, x|
  line.chomp.each_char.each_with_index do |c, y|
    INPUT[x + y.i] = c.to_i
  end
end

# get all the neighbors of the position `z`
def neighbors(z)
  [z+1,z-1,z+1i,z-1i].select(&INPUT)
end

# get the initial risk
RISKS = {
  [INPUT.last[0], INPUT.last[0]] => INPUT.last[1]
}

def solve(start, visited=[])
  
  if (cached = RISKS[start])
    return cached
  end

  ne = neighbors(start) - visited # get nonvisited neighbors
  v2 = visited + ne + [start] # new list of visited things

  RISKS[start] = INPUT[start] + ne.map { |neighbor| solve(neighbor, v2) }.min
end

# # get the initial risk
# RISKS = [INPUT.to_a.last].to_h

# def solve(start, visited=[])
#   RISKS[start] ||= begin
#     ne = neighbors(start) - visited
#     v2 = visited + ne + [start]

#     INPUT[start] + ne.map { solve _1, v2 }.min
#   end
# end

p solve(0+0i) - INPUT.first[1]
p 
=begin
1911
2991
3991
9991

=end
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
