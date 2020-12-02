open STDIN, "day1.txt";

for $line (<>) {
	for (@lines) {
		next unless $_ + $line == 2020;
		print $_ * $line, "\n";
		exit
	}

	push @lines, $line;
}
