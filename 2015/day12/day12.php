<?php
$input = file_get_contents('day12.txt');

preg_match_all('/-?\d+/', $input, $result) or die("nope");

$part1 = array_sum($result[0]);

function count_input($input): int {
	switch (true) {
		case is_string($input): return 0;
		case is_int($input): return $input;
		case !is_array($input): die("bad");
		case !is_null($input[0]): return array_sum(array_map('count_input', $input));
		case in_array('red', array_values($input), true): return 0;
		default: return array_sum(array_map('count_input', array_values($input)));
	}
}

$part2 = count_input(json_decode($input, true));
echo "Part 1: $part1\nPart 2: $part2\n";
