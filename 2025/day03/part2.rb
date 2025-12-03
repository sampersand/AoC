$* << 'input.txt' if $*.empty?
class String; attr_accessor :pos end

def find_largest(line, remaining)
  return [] if remaining.zero?

  max = line[..-remaining].max
  [max] +find_largest(line[line.index(max)+1..], remaining-1)
end

p $<.each(chomp: true).sum{|line|
  p find_largest(line.chars, 12).join.to_i
}
