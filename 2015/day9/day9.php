<?php

$file = fopen('day9.txt', 'r') or die('cant read file');

$dists = [];

while (!feof($file)) {
	if (!preg_match("/(\w+) to (\w+) = (\d+)/", fgets($file), $matches)) {
		break;
	}
	$dists[$matches[1]][$matches[2]] = intval($matches[3]);
}

$sofar = [];
uasort($dists, function ($l, $r) use ($dists) { return count($l) <=> count($r); });
print_r($dists);
exit;

foreach ($dists as $galaxy => $gdists) {
	print_r($gdists);
	echo ">";
	print_r($sofar);
	foreach (array_keys($sofar) as $key) {
		unset($gdists[$key]);
	}

	$sofar[$galaxy] = array_values($gdists)[0];
}

$part1 = array_sum(array_values($sofar));

print_r($part1);
