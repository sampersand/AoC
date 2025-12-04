#!/bin/zsh

# For this day, i thought it'd be fun to use ZSH's math functions:
#
# ZSH, like all bourne shells, has `$(( ... ))` for math expressions. But, it lets you define
# and use "math" functions, eg `echo $(( double(3) ))`. To do so, you have to `functions -M name` to
# register it as a math function, and then the "return value" is... the _last evaluated math
# expression_. bizarre. Example:
# ```zsh
# function double { (( $1 * 2 )) }
# functions -M double
# echo $(( double(10) )) #=> 20
# ```


functions -M find_largest
function find_largest {
  local sub max remaining=$1
  shift

  # find the max value in the prefix, and then delete everything up to it from the args
  shift $@[(i)${max::=${${(O)@[1,-remaining]}[1]}}]

  # If there's anything remaining, then recurisvely call it again
  if (( --remaining )) {
    let "sub=find_largest(remaining, ${(j:,:)@})"
  }

  # "return value" is just a simple concat of the strings
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
