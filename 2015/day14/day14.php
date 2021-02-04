<?php

error_reporting(E_ALL);

$file = fopen('day14.txt', 'r') or die('cant read file');

$reindeer = [];

while (!feof($file)) {
// Vixen can fly 8 km/s for 8 seconds, but then must rest for 53 seconds.

	if (!preg_match("/(\w+)\b\D*(\d+)\D*(\d+)\D*(\d+)/", fgets($file), $matches)) {
		break;
	}
	$reindeer[] = [];
	$reindeer[count($reindeer) - 1]['velocity'] = intval($matches[2]);
	$reindeer[count($reindeer) - 1]['limit'] = intval($matches[3]);
	$reindeer[count($reindeer) - 1]['cooldown'] = intval($matches[4]);
}

function fly($details) {
	$dist = 0;
	$sleep = -$details['limit'];
	for ($i = 0; $i < 2503; $i++) { 
		if ($sleep++ < 0) {
			$dist += $details['velocity'];
		} else if ($sleep == $details['cooldown']) {
			$sleep = -$details['limit'];
		}
	}
	return $dist;
}

// function 

$part1 = max(array_map('fly', $reindeer));

$dists = array_fill(0, count($reindeer), 0);
$scores = array_fill(0, count($reindeer), 0);
$sleeps = array_map(function ($x) { return -$x['limit']; }, $reindeer);

for ($i=0; $i < 2503; $i++) { 
	for ($j=0; $j < count($reindeer); $j++) { 
		if ($sleeps[$j]++ < 0) {
			$dists[$j] += $reindeer[$j]['velocity'];
		} else if ($sleeps[$j] == $reindeer[$j]['cooldown']) {
			$sleeps[$j] = -$reindeer[$j]['limit'];
		}
	}

	$max = max($dists);
	for ($j=0; $j < count($reindeer); $j++) { 
		if ($dists[$j] == $max) {
			$scores[$j]++;
		}
	}
}

$part2 = max($scores);

echo "Part 1: $part1\nPart 2: $part2\n";
