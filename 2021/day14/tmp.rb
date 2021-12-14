$stdin = open('day14.txt')
# $stdin = DATA

start = gets.chomp
pol = {}
$stdin.each_line do |line|
  line =~ /\s->\s/ or next
  pol[$`] = $'.chomp
end

40.times do
  s = ''
  start.length.times do |i|
    s.concat start[i]
    if x=pol[start[i, 2]]
      s.concat x
    end
  end
  start.replace s
end
p start.chars.tally.sort_by(&:last)
# puts s


__END__
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
