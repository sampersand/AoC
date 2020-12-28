<?php

$file = fopen('day7.txt', 'r') or die('cant read file');

global $wires;
$wires = [];

// while (!feof($file)) {
// 	if (!$line = chop(fgets($file))) {
// 		break;
// 	}
$line = '0 -> c';
	[$expr, $var] = explode(' -> ', $line);

switch (1) {
	case preg_match('/^(0|\d+)$/', $expr):
		break;
	// case (1 == preg_match('/^\w+$/', $expr)):
	// 	break;
	// case (1 == preg_match('/\ANOT (\w+)\z/', $expr, $args)):
	// 	[, $arg] = $args;
	// 	$arg or die("wrong spot '$line'" . var_dump(1 == preg_match('/^\d+$/', $expr)));
	// 	break;
	default:
		die("bad expr '$expr'.");
}

