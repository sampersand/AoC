#!/bin/zsh
function find-largest {
  local remaining=$1
  shift

  if (( remaining == 0 )) {
    REPLY=
    return
  }

  local max=${${(O)@[0,-remaining]}[1]}
  local max_idx=${@[(i)$max]}
  shift $max_idx
  find-largest $((remaining - 1)) $@
  REPLY=$max$REPLY
}

part1=0 part2=0
<input.txt while read line; do
  find-largest 2 ${(s::)line}; let "part1+=$REPLY"
  find-largest 12 ${(s::)line}; let "part2+=$REPLY"
done
print $part1 $part2
