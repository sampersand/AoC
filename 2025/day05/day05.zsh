#!/bin/zsh

if [[ ! -t 0 ]] exec < input.txt

ranges=()
fresh=()
while IFS=- read -A input; do
	if (( $#input == 2 )) {
		ranges+=( "$input" )
	} else {
		fresh+=( $input )
	}
done

integer part1
foreach id ($fresh)
	foreach start stop ($=ranges)
		if (( start <= id && id <= stop )) {
			let part1++
			continue 2
		}
	end
end

functions -M in 3; in () { (( $2 <= $1 && $1 <= $3 )); true }
function merge {
	local a=($=1)
	local b=($=2)
	if (( in(a[1], b[1], b[2]) && in(a[2], b[1], b[2]) )) { REPLY=$2; return }
	if (( in(b[1], a[1], a[2]) && in(b[2], a[1], a[2]) )) { REPLY=$1; return }

	local dir=$(( a[1] != b[1] ? a[1] < b[1] : a[2] < b[2] ))
	local -a earlier later
	if (( dir )) {
		earlier=($a); later=($b)
	} else {
		earlier=($b); later=($a)
	}
	if (( earlier[2] + 1 < later[1] )) return 1
	REPLY="$earlier[1] $later[2]"
}

p $part1

fresh_ranges=()
while (( $#ranges )) do
	range=$ranges[1]; shift ranges

	overlaps=()
	x=()
	foreach tmp ($fresh_ranges)
		if merge $tmp $range; then
			overlaps+=$REPLY
		else
			x+=$tmp
		fi
	end
	fresh_ranges=($x)

	if (( !$#overlaps )) {
		fresh_ranges+=$range
	} else {
		ranges+=($overlaps)
	}
done

integer part2
foreach x y ($=fresh_ranges)
	let "part2+=$y-$x + 1"
end

if (( $part1 != 885 )) echo bad part1: $part1
if (( $part2 != 348115621205535 )) echo bad part2: $part2

echo $part1 $part2
