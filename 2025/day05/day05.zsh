#!/bin/zsh

if [[ ! -t 0 ]] exec < input.txt

ranges=() fresh=()
while IFS=- read -A input && [[ -n $input ]]; do
	ranges+=( "$input" )
done

integer part1
while read id; do
	foreach start stop ($=ranges)
		if (( start <= id && id <= stop )) {
			let part1++
			continue 2
		}
	end
done

function merge {
	local tmp a=($=1) b=($=2)

	functions -M in 3; in () (( $2 <= $1 && $1 <= $3 ))
	if (( in(a[1], b[1], b[2]) && in(a[2], b[1], b[2]) )) { REPLY=$2; return }
	if (( in(b[1], a[1], a[2]) && in(b[2], a[1], a[2]) )) { REPLY=$1; return }
	if (( a[1] == b[1] ? b[2] <= a[2] : b[1] <= a[1] )) { tmp=($a) a=($b) b=($tmp) }
	if (( a[2] < b[1] - 1 )) return 1
	REPLY="$a[1] $b[2]"
}

fresh_ranges=()
while (( $#ranges )) do
	range=$ranges[1]; shift ranges

	_fresh_ranges=()
	foreach tmp ($fresh_ranges)
		if merge $tmp $range; then
			ranges+=$REPLY
		else
			_fresh_ranges+=$tmp
		fi
	end

	if (( $#fresh_ranges == $#_fresh_ranges )) _fresh_ranges+=($range)
	fresh_ranges=($_fresh_ranges)
done

integer part2
foreach start stop ($=fresh_ranges)
	let "part2+=$stop-$start + 1"
end

echo $part1 $part2
