#!/bin/zsh
setopt rematchpcre

let part1=0 part2=0
for raw_line in ${(s:,:):-$(cat ${@:-input.txt})}; do
	range=( ${(s:-:)raw_line} )

	for (( i=range[1]; i < range[2]; i++ )) {
		if [[ $i =~ '^(\d+)\1$' ]] let part1+=i;
		if [[ $i =~ '^(\d+)\1+$' ]] let part2+=i;
	}
done

echo part1: $part1
echo part2: $part2
