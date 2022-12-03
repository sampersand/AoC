require_relative '../submitter'
require 'set'
# require_relative '../shorthand'
data = download! 2022, 3

p data.lines.map(&:chomp).map { 
  _1.chomp!
  x = _1.chars[..._1.length / 2]
  y = _1.chars[_1.length / 2..]
  q = (x&y)[0]
  p 1 + (('a'..'z').to_a.join.index(q) || ('A'..'Z').to_a.join.index(q)+26)
}.sum

p data.lines.map(&:chomp).each_slice(3).map { 
  q = _1.map(&:chars).reduce(&:&)[0]
  # exit
  # _1.chomp!
  # x = _1.chars[..._1.length / 2]
  # y = _1.chars[_1.length / 2..]
  # q = (x&y)[0]
  p 1 + (('a'..'z').to_a.join.index(q) || ('A'..'Z').to_a.join.index(q)+26)
}.sum
