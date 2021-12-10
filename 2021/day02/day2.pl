open STDIN, 'day2.txt';
# note that `aim` in part 2 is simply the depth from part 1
while (<>) {
  $horiz += $', $depth2 += $depth1 * $' if /forward/;
  $depth1 += $' if /down/;
  $depth1 -= $' if /up/;
}

print "part1: ", $horiz*$depth1, "\n";
print "part2: ", $horiz*$depth2, "\n";
