<?php

$contents = explode(PHP_EOL, file_get_contents('day1.txt'));

$part1 = 0;
foreach ($contents as $line) {
	$part1 += intdiv(intval($line), 3) - 2;
}

echo "Part 1: $part1\n";

function fuel_for($mass) {
	$fuel = intdiv($mass, 3) - 2;
	return $fuel + ($fuel > 0 ? fuel_for($fuel) : 0);
}

$part2 = fuel_for(100756) - 100756;

echo "Part 2: $part2\n";


// print $contents;
