<?php
$raw = explode("\n", chop(file_get_contents('tickertape.txt')));
$ttape = [];

foreach ($raw as $line) {
	[$key, $val] = explode(': ', $line);
	$ttape[trim($key)] = intval($val);
}

$file = fopen('day16.txt', 'r') or die('cant read file');

$sues = [];

while (!feof($file)) {
	$line = fgets($file);
	if (!$line) continue;
	[$sue, $rest] = explode(': ', $line, 2);

	preg_match_all('/(\w+): (\d+)/', $rest, $matches) or die("bad line $rest");
	
	for ($i=0; $i < count($matches[1]); $i++) { 
		if (intval($matches[2][$i]) !== $ttape[$matches[1][$i]]) {
			continue 2;
		}
	}

	print_r($sue);
	exit;
}
