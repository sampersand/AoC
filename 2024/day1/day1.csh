#!/bin/csh

# Read input from standard input or a file
set left = ()
set right = ()

# Read the input into two arrays
while (<>) do
    set left = ($left[1-] $1)
    set right = ($right[1-] $2)
end

# Sort both arrays
set left = (`echo "$left" | tr ' ' '\n' | sort -n`)
set right = (`echo "$right" | tr ' ' '\n' | sort -n`)

# Calculate the total distance
set total_distance = 0
@ i = 1
while ($i <= $#left)
    @ diff = `expr $left[$i] - $right[$i]`
    if ($diff < 0) then
        @ diff = -$diff
    endif
    @ total_distance += $diff
    @ i++
end

echo "Total Distance: $total_distance"
