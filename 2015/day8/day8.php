<?php

$file = fopen('day8.txt', 'r') or die('cant read file');

$code = 0;
$memory = 0;
$new = 0;

while (!feof($file)) {
	$line = chop(fgets($file));
	$code += strlen($line);
	$memory += strlen(eval("return $line;"));
	$q = addslashes($line);
	($line === eval("return \"$q\";")) or die("nope");
	$new += strlen('"' . $q . '"');
}


echo "Part 1: ", $code - $memory, "\nPart 2: ", $new - $code, "\n";
