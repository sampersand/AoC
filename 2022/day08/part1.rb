require 'set'
$stdin = open 'day8.txt'

# read the lines into the hashmap
trees = {}

raw = $stdin.read.lines(chomp: true).map(&:chars)
raw = <<EOS.lines(chomp: true).map { _1.chars }
30373
25512
65332
33549
35390
EOS
map = {}
raw.each_with_index do |line, x|
  line.each_with_index do |c, y|
    map[x + y.i] = c
  end
end
seen = Set.new
2.times do
  raw.each do |line|
    2.times do
      max = -1
      line.each do |chr|
        if max < chr.to_i
          seen.add chr + '-'+chr.__id__.to_s
          max = chr.to_i
        end
      end
      line.reverse!
    end
  end
  raw = raw.transpose
end

$map=map
def scenic(coord)
  score = 1
  # x = coord.real
  p (coord.imag..).count { $map[_1 + coord.imag.i] }
  # q = $raw[0].length.times.map { _1 + coord.imag.i } +
  #     $raw.length.times.map { _1.i + coord.imag }
  #   score 
  # exit
end

p scenic 3+2i

p seen.length



__END__
total = 0
def doit(map)
  map.each do |line|
    next if line == map[0] || line == map[-1]
    2.times do 
      n = line[0].to_i
      nil while n<9&&line.gsub!(/\A(..*?)([#{n+1}-9])(?!$)/) { n = $2.to_i; $1 + '*' }
      line.reverse!
    end
  end
end

doit map
map = map.map(&:chars).transpose.map(&:join)
doit map
puts map
puts map.join.count('*')#+map[0].length*2+map[0].length.-(1)*2
exit
map = map.map(&:chars).transpose.map(&:join)
map.each do |line|
  next if line == map[0] || line == map[-1]
  2.times do 
    line.gsub!(/\A.*?[#{line[0].to_i+1}-9]/) { '-'*$&.length }
    total += $&&.length||0
    line.reverse!
  end
end
puts map

=begin
30373
2--12
6-3-2
33-49
35390
=end
__END__
$stdin.each_line.each_with_index do |line, y|
  line = line.chomp
  line.chars.each_with_index do |char, x|
    trees[x + y.i] = char
  end
end


# Find extremities
MAX_X = trees.keys.map(&:real).max
MAX_Y = trees.keys.map(&:imag).max

########
#aqrstu#
#b     #
#c     #
#d     #
########

# find visible trees

VISIBLE = Set.new
n = 0.upto(MAX_X).to_a
n = n.flat_map{[_1+0i, _1+98i]} + n[1..-2].flat_map{[_1.i, _1.i+98]}
pp n
p n
n.each do |coord|
  visible.add coord
  (n.real..99)
__END__
exit
p ([*0..99]).product([*0..99]).map{ _1+_2.i}
exit
(MAX_X+1).times do |x|
  next if x.zero? || x == MAX_X
  p x
  next
  exit
end
__END__
  if x.zero? || x == MAX_X 
    raise "todo"
  end

  currrent_tree = trees[x + 0.i]
  (MAX_Y+1).times do |y|

  ...

  p x
end
exit

p NORMAL
exit
LIST = Set.new

p LIST
# p LIST[0+0i].__id__
# p LIST[2+0i].__id__
__END__
data = download! 2022, 8, lines: true

hashmap = {}
data.each_with_index do |line, y|
  line.chars.each_with_index do |char, x|
    hashmap[x + y.i] = char.to_i
  end
end
p data[.length
exit
p hashmap

__END__
$counted = {}
data =Matrix[*<<EOS.lines.map(&:chomp).map(&:chars)]
30373
25512
65332
33549
35390
EOS


p data
exit
$q = {}

grid.each_with_index.map do |k,v|
  q = k.each_with_index.count do |k2, v2|
    k[0] <= k2
    p k
    p k2
    exit
  end
  next if k == 0 || k == grid.length - 1
  p k
  exit
end
# submit! 'answer', 2
