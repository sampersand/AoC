require_relative '../submitter'
require_relative '../aoc'

using Aoc

data = download! 2022, 6, lines: true

submit! 4 +(data[0].index data[0].chars.each_cons(4).find { _1.uniq.4 == 14 }.join), 2
submit! 14 +(data[0].index data[0].chars.each_cons(14).find { _1.uniq.length == 14 }.join), 2
