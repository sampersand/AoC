open STDIN, 'day1.txt';

$/ = "";
@x = reverse sort map { eval join $" = '+', split } <>;
print $x[0], "\n", eval "@x[0..2]";
