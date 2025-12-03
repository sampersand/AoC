$* << 'input.txt' if $*.empty?

def find_largest(chars, remaining)
  return '' if remaining.zero?

  max = chars[..-remaining].max
  max + find_largest(chars[chars.index(max)+1..], remaining-1)
end

p1 = p2 = 0
ARGF.each(chomp: true) {
  p1 += find_largest(it.chars, 2).to_i
  p2 += find_largest(it.chars, 12).to_i
}

p [p1, p2]

fail unless p1 == 16946
fail unless p2 == 168627047606506
