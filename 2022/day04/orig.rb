require_relative '../submitter'
require_relative '../shorthand'
require 'set'
using Aoc

data = download!(2022, 4, lines: true)

puts data.count {
  x,y = _1.split ','
  x =~ /-/
  x = ($`.to_i..$'.to_i).to_set
  y =~ /-/
  y = ($`.to_i..$'.to_i).to_set
  x.superset? y or y.superset? x
}

puts data.count {
  x,y = _1.split ','
  x =~ /-/
  x = ($`.to_i..$'.to_i).to_set
  y =~ /-/
  y = ($`.to_i..$'.to_i).to_set
  !(x & y).empty?
}
