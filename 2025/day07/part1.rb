$* << 'input.txt' if $*.empty?

data = $<.to_a(chomp: true)
last = data[0]

split = 0
data[1..].each do |line|
  last.each_char.with_index do |char, index|
    next unless char == 'S' || char == '|'
    case line[index]
    when '.' then line[index] = '|'
    when '^'
      split += 1
      line[index-1] = line[index+1] = '|'
    when '|'
      # nothing
    else
      fail "Bad: #{index} (#{line})"
    end
  end
  last = line
end

puts data



p data
p split

__END__
MAP = {}
for line, x in $<.each_with_index
  line.each_char.with_index do |char, y|
    MAP[x+y.i] = '^' if char == '^'
    $start = x+y.i if char == 'S'
  end
end

$limit = x

pos = 0
prev = [ $start ]
1.upto $limit do |pos|
  curr = []
  prev.each do |coord|
    p MAP[coord + pos.i]
  end
  exit
end

p MAP
