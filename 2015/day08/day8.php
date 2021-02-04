<?php

$file = fopen('day8.txt', 'r') or die('cant read file');

$code = $memory = $new = 0;

while (!feof($file)) {
	$line = chop(fgets($file));
	if (!$line) continue;

	$code += strlen($line);
	$memory += strlen(eval("return $line;"));
	$new += strlen(preg_replace('/(?=[\\\\"])/', '\\', $line)) + 2;
}

echo "Part 1: ", $code - $memory, "\nPart 2: ", $new - $code, "\n";
