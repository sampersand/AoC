#!/bin/zsh
input=( $(<input.txt) )

for (( ip=1; 0 < ip && ip <= $#input; steps++ )) {
	let 'ip+=input[ip]++'
}
print part1: $steps

input=( $(<input.txt) )
for (( ip=1; 0 < ip && ip <= $#input; steps++ )) {
	(( (x=input[ip]) >= 3 ? input[ip]-- : input[ip]++ ))
	(( ip += x ))
}
print part2: $steps
