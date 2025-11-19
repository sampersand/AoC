$stdin = open('input.txt')
# $stdin = DATA

o = 0
t = Hash.new 0

$stdin.each do |line|
  line =~ /\d+:/
  t[num = $&.to_i] += 1
  l, r = $'.split('|').map { _1.split.map(&:to_i) }
  f = r.count { l.any? _1 }
  o += 1 << f-1
  f.times { t[num + 1 + _1] += t[num] }
end

p o 
p t.values.sum
