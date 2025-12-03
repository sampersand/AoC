#!/bin/zsh
setopt REMATCH_PCRE

let part1=0
let part2=0

for line in ${(s:,:):-$(cat ${@:-input.txt})}; do
	range=( ${(s:-:)line} )

	for (( i = range[1]; i < range[2]; ++i )) {
		if [[ $i =~ '^(\d+)\1$'  ]] let part1+=i;
		if [[ $i =~ '^(\d+)\1+$' ]] let part2+=i;
	}
done

print part1: $part1
print part2: $part2
