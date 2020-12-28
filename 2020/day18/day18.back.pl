open STDIN,'day18.txt';

$lines=join "+", map { y/*/-/; s/\d+/bless([$&])/g; "($_)" } <>;

use overload
	'+' => $y=sub { bless[shift->[0] + shift->[0]] },
	'/' => $y,
	'*' => $x=sub { bless[shift->[0] * shift->[0]] },
	'-' => $x;

print "Part 1: ", eval($lines)->[0], "\n";
print "Part 2: ", eval($lines =~ y|+|/|r)->[0], "\n" ;
