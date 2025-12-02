#!/bin/zsh
setopt rematchpcre
found=0
for raw_line in ${(s:,:):-$(cat input.txt)}; do
	range=(${(s:-:)raw_line})
	readonly start=$range[1]
	readonly stop=$range[2]

	echo $raw_line
	for (( i=start; i < stop; i++  )) {
		if [[ $i =~ '^(\d+)\1$' ]] {
			let found+=$i
		}
	}
done
echo $found
# lines = File.read('input.txt')
#   .split(',')
#   .map { it.split('-').map(&:to_i)  }
#   .map { _1.._2 }

# puts lines.sum { |range| range.select { /^(\d+)\1$/ =~ it.to_s }.sum }
# puts lines.sum { |range| range.select { /^(\d+)\1+$/ =~ it.to_s }.sum }

# val=0202
# expr "$val" : '\([0-9][0-9]*\)\1' >/dev/null && printf "%s\n" "$val"
