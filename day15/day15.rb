map = Hash.new { _1[_2] = [$., $.] }

open('day15.txt').each_line(',') { map[_1.to_i] }

last = map.keys.last

map[last = map[last].reduce(&:-)].unshift($.).pop until 30000001 == $. += 1

p last
