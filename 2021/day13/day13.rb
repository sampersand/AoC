$stdin = open('day13.txt')
PAPER = gets("").chomp.each_line.map { eval "[#{_1}]" }

$stdin.each_line.each_with_index do |line, idx|
  line =~ /(\w)=(\d+)/
  n = $2.to_i

  if $1 == 'y'
    PAPER.map! { [_1, _2 < n ? _2 : 2*n - _2] }
  else
    PAPER.map! { [_1 < n ? _1 : 2*n - _1, _2] }
  end

  puts "part1: #{PAPER.length}" if idx.zero?
end

width = PAPER.map(&:last).max + 1
height = PAPER.map(&:first).max + 1

m = Array.new(width){" "*height}
PAPER.each do
  m[_2][_1] = "#"
end

puts m
