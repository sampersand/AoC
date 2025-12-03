#!/bin/zsh
setopt re_match_pcre

let part{1,2}=0
foreach line (${(s(,)):-$(cat ${@:-input.txt})}) {
	foreach i ({${line/-/..}}) {
		if [[ $i =~ '^(\d+)\1$'  ]] let part1+=i;
		if [[ $i =~ '^(\d+)\1+$' ]] let part2+=i;
	}
}

print part1: $part1
print part2: $part2
