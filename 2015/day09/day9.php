<?php

$file = fopen('day9.txt', 'r') or die('cant read file');

$dists = [];

while (!feof($file)) {
	if (!preg_match("/(\w+) to (\w+) = (\d+)/", fgets($file), $matches)) {
		break;
	}
	$dists[$matches[1]][$matches[2]] = intval($matches[3]);
	$dists[$matches[2]][$matches[1]] = intval($matches[3]);
}

function traveling_santa($src, $cmp='min', $sofar = null) {
	global $dists;
	$sofar[$src] = true;
	$ret = null;

	foreach (array_diff_key($dists[$src], $sofar) as $dst => $distance) {
		$distance += traveling_santa($dst, $cmp, $sofar);
		$ret = is_null($ret) ? $distance : $cmp($ret, $distance);
	}

	return $ret;
}


$keys = array_keys($dists);

$part1 = min(array_map('traveling_santa', $keys));
$part2 = max(array_map(function ($s) { return traveling_santa($s, 'max'); }, $keys));

echo "Part 1: $part1\nPart 2: $part2\n";
