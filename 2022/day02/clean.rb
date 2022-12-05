require_relative '../submitter'

$stdin = open 'input.txt'

# These are the equations you can use to solve each part.
def part1(x, y) = (x - y + 1)%3*3 + x + 1
def part2(x, y) = (x + y - 1)%3 + 3*x + 1

$stdin
  .sum { |line| # Iterate over each line, and sum the return values
    # Extract out the bytes in the line
    them, _, us = line.bytes

    # Correct the bytes to convert from ABC/XYZ to 012/012
    us &= 3
    them = (them & 3) - 1

    # get the answer for part 1 and part 2
    part1(us, them) + part2(us, them).i
  }
  .rect # convert from imaginary to coordinates
  .display # print it out
