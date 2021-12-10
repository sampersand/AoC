open STDIN, "day1.txt";


($l<$_&&$a++),$l=$_ while<>;
print "part1: $a";

__END__

open STDIN, "day1.txt";

my $acc = 0;
my $last;

while (<>) {
 $acc++ if $last < $_;
 $last = $_;
}

print "part1: $acc";
