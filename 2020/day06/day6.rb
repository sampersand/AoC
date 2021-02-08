# Rank 62 for part 1!

# PART 1:
$/=""; # paragraph mode, you're my savior.

open('day6.txt').map { _1.gsub(/\s/,"").chars.uniq.count }.sum.display

# Reset between parts
puts

# Part 2:
$/="";
open('day6.txt').map { _1.split.map(&:chars).reduce(&:&).count }.sum.display
