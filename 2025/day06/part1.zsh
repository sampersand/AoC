#!/bin/zsh
if [[ ! -t 0 ]] exec < sample.txt

cat

exit
$* << 'input.txt' if $*.empty?

INPUT = $<.map(&:chomp)
SEPS = INPUT.pop.split
MAX_WIDTH = INPUT.map(&:length).max

part1 = INPUT.map { it.split.map(&:to_i) }
  .transpose
  .zip(SEPS)
  .sum { |nums, op| nums.reduce op }

part2 = INPUT
  .map { it.ljust(MAX_WIDTH) } # make sure all lines are same length
  .map(&:chars) # split from strings into array of chars
  .transpose.map(&:join) # transpose the array, and combine each array into a string
  .slice_after(/^\s+$/).to_a.tap { it.last << '' }.each(&:pop) # Split on whitespace
  .map { it.map(&:to_i) } # Convert the resulting strings to numbers
  .zip(SEPS).sum { |nums, op| nums.reduce op } # Perform the operation on each line

p [part1, part2]
