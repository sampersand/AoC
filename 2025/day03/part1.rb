$* << 'input.txt' if $*.empty?
class String; attr_accessor :pos end

p $<.each(chomp: true).sum{|line|
  c = line.chars.each_with_index.map{|c,i| c.pos = i; c}
  max = c.max
  if max.pos == line.length - 1
    max = c[..-2].max
  end

  second = c[max.pos+1..].max
  [max, second].join.to_i
}
