$* << 'input.txt' if $*.empty?


p $<.each_line.map(&:split).transpose
  .map { x=_1.pop; _1.map(&:to_i).reduce x }
  .sum

