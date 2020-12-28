<?php

$file = fopen('day6.txt', 'r') or die('cant read file');

$grid1 = [];
$grid2 = [];

while (!feof($file)) {
	$line = fgets($file);
	if (!preg_match('/(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/', $line, $matches)) {
		break;
	}

	for ($x = $matches[2]; $x <= $matches[4]; $x++) {
		for ($y = $matches[3]; $y <= $matches[5]; $y++) {
			switch ($matches[1]) {
				case 'toggle':
					$grid1[$x][$y] ^= 1;
					$grid2[$x][$y] += 2;
					break;
				case 'turn on':
					$grid1[$x][$y] = 1;
					$grid2[$x][$y]++;
					break;
				case 'turn off':
					$grid1[$x][$y] = 0;
					if ($grid2[$x][$y]) {
						--$grid2[$x][$y];
					}
			}
		}
	}
}

$part1 = 0;
$part2 = 0;

foreach (array_values($grid1) as $values) {
	$part1 += count(array_filter($values));
}

foreach (array_values($grid2) as $values) {
	$part2 += array_sum(array_filter($values));
}
//400410
echo "Part 1: $part1\nPart 2: $part2\n";
