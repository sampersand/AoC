<?php

// parse out the ticker tape that we're given.
// example: `children: 3`
$raw = explode("\n", chop(file_get_contents('tickertape.txt')));
$ttape = [];
foreach ($raw as $line) {
	[$key, $val] = explode(': ', $line);
	$ttape[trim($key)] = (int) $val;
}

// find the sue that's applicable
$file = fopen('day16.txt', 'r') or die('cant read file');
$sues = [];
while (!feof($file)) {

	// parse the input line
	// example: `Sue 1: children: 1, cars: 8, vizslas: 7`
	$line = chop(fgets($file));
	if (!$line) continue; // if the line is empty, just ignore it.
	[$sue, $rest] = explode(': ', $line, 2);
	preg_match_all('/(\w+): (\d+)/', $rest, $matches) or die("bad line $rest");
	
	// check to see if all the fields match
	for ($i=0; $i < count($matches[1]); $i++) { 
		$cat = $matches[1][$i];
		$val = (int) $matches[2][$i];

		// if any of them don't match, start the next line.
		switch ($cat) {
			case 'cats':
			case 'trees':
				if ($val > $ttape[$cat]) break;
				continue 3; // go to the while loop.
			case 'pomeranians':
			case 'goldfish':
				if ($val < $ttape[$cat]) break;
				continue 3; // go to the while loop
			default:
				if ($ttape[$cat] === $val) break;
				continue 3; // go to the while loop.
		}
		// the current field matches
	}

	// all the fields matched.
	echo "Answer: $sue\n";
	return;
}

echo "No sue found?";
