<?php
$input = str_split(chop(file_get_contents('day3.txt')));

function visit_houses($contents) {
	$x = $y = 0;
	$visited = [[0 => 1]];

	foreach ($contents as $char) {
		switch ($char) {
			case '<': $x--; break;
			case '>': $x++; break;
			case 'v'; $y--; break;
			case '^'; $y++; break;
		}

		 
		$visited[$x][$y]++;
	}
	return $visited;
}

$santa=[];
$robot=[];

for ($i=0; $i < count($input); $i++) { 
	if ($i % 2 == 0) {
		$santa[] = $input[$i];
	} else {
		$robot[] = $input[$i];
	}
}


$part1 = array_sum(array_map('count', array_values(visit_houses($input))));

$part2 = visit_houses($santa);
foreach (visit_houses($robot) as $key => $value) {
	$part2[$key] = ($part2[$key] ?? []) + $value;
}
$part2 = array_sum(array_map('count', array_values($part2)));

echo "Part 1: $part1\nPart 2: $part2\n";
