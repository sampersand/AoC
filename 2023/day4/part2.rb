$stdin = open('input.txt')
# $stdin = DATA

q = Hash.new 0

$stdin.each { |line|
  line =~ /Card\s*(\d+):/
  num = $1.to_i
  l, r = $'.split '|' 
  l = l.strip.split.map(&:to_i)
  f=0
  r = r.strip.split.map(&:to_i)
  r.each do |c|
    next unless l.any? c
    if f==0
      f = 1
    else
      f += 1
    end
  end
  q[num] += 1
  # amnt = (q.delete(num) || 0) + 1
  f.times {
    q[num + 1 + _1] += q[num]
  }
  p [f, q]
}
p q.values.sum
# p q

__END__
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
