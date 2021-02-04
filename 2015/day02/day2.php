<?php
error_reporting(E_ALL);

$input = explode(PHP_EOL, file_get_contents('day2.txt'));

$part1 = 0;
$part2 = 0;

foreach ($input as $line) {
	if (!$line || $line == "\n")
		continue;

	$l = explode('x', preg_replace('/\s+/', '', $line));
	sort($l);
	[$x, $y, $z] = $l;

	$part1 += 3*$x*$y + 2*$x*$z + 2*$y*$z;
	$part2 += $x*$y*$z + $x*2 + $y*2;
}


echo "Part 1: $part1\nPart 2: $part2\n";
