# Inspired by a conversation with someone on Discord.
xs = open('day5.txt', &:read).tr("FBLR", "0101").lines.map { _1.to_i 2 }

p xs
puts xs.max
puts [*xs.min .. xs.max] - xs
