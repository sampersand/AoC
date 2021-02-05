open STDIN,'day3.txt'; # Omit if reading from stdin
chomp,push@lines,$_ for<>;

for ([1,1],[3,1],[5,1],[7,1],[1,2]) {
  ($right,$down)=@$_;

  for 
  print $d;
}

=finish
lines = open('day3.txt', &:read)    # Open thee file `day3.txt` and read the entire thing
  .lines                            # Get an array of lines from the file.
  .map(&:chomp)                     # Strip off trailing newlines

[[1,1], [3,1], [5,1], [7,1], [1,2]] # List of `[right, down]` to try
  .map { |right, down|              # For every right and down...
    lines                           # ... take the list of lines
      .each_with_index              # ... and get an array of `[line, index]`
      .drop(1)                      # ... delete the first line
      .each_slice(down)             # ... for every `down` rows
      .map(&:first)                 # ... take only the first row
      .count { |line, idx|          # ... Count the amount of lines that this block returns `true`
        line[(idx * right) % line.length] == '#'
      }
      .tap { |n|                    # Print part 1 if we're going down 3.
        puts "Part 1: #{n}" if right == 3
      }
  }
  .reduce(&:*)                      # ... get the product of the list
  .tap { |n| puts "Part 2: #{n}" }  # ... and print the result out
