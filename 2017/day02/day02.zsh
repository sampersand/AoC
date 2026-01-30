#!/bin/zsh
cd -- ${0:A:h}; source ../../utils/utils.zsh

input=( "${(@f)$(<input.txt)}" )
integer part{1,2}

for line ($input) {
	ary=( ${(On)=line} )
	let part1+='ary[1] - ary[-1]'

	for (( i = 1; i <= $#ary; i++ )) {
		for (( j = i + 1; j <= $#ary; j++ )) {
			if (( x = divisible_by(ary[i], ary[j]) )) {
				part2+=x
				continue 2
			}
		}
	}
}

print -l $part1 $part2

exit

older one that didnt use utils.zsh:
# input=( "${(@f)$(<input.txt)}" )
# integer part1

# for line ($input) {
# 	ary=( ${(on)=line} )
# 	let part1+='ary[-1] - ary[1]'
# }

# integer part2
# for line ($input) {
# 	ary=( ${(On)=line} )

# 	for (( i = 1; i <= $#ary; i++ )) {
# 		for (( j = i + 1; j <= $#ary; j++ )) {
# 			if (( (ary[i] / ary[j]) * ary[j] == ary[i] )) {
# 				let part2+='ary[i] / ary[j]'
# 				continue 2
# 			}
# 		}
# 	}
# }

# print -l $part1 $part2
