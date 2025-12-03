#!/bin/zsh

# For this day, i thought it'd be fun to use ZSH's math functions:

functions -M find_largest
function find_largest {
  local sub max remaining=$1
  shift

  shift $@[(i)${max::=${${(O)@[1,-remaining]}[1]}}]

  if (( --remaining )) {
    let "sub=find_largest(remaining, ${(j:,:)@})"
  }

  (( $max$sub ))
}

part1=0 part2=0
<${@:-input.txt} while read raw; do
  line=${(*)raw//(#m)?/,$MATCH}

  ((
    part1+=find_largest(2 $line),
    part2+=find_largest(12 $line)
  ))
done

print -aC2 part1: $part1 part2: $part2
