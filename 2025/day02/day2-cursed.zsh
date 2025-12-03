#!/bin/zsh
options[rematch_pcre]=on

define part{1,2}=0
for line in ${(s(,)):-$(<${@:-sample.txt})}
	foreach i ({${line/-/..}}) {
		if [[ $i =~ '^(\d+)\1$'  ]] let part1+=i
		if [[ $i =~ '^(\d+)\1+$' ]] let part2+=i
	}

print -aC2 part1: $part1 part2: $part2
