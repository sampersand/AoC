<?php

$file = fopen('day7.txt', 'r') or die('cant read file');

global $wires;
$wires = [];

function fetch($var) {
	global $wires;

	if (is_numeric($var)) {
		return intval($var);
	} else if (is_numeric($val = $wires[$var])) {
		return intval($val);
	} else {
		return $wires[$var] = $val();
	}
}

while (!feof($file)) {
	if (!$line = chop(fgets($file))) {
		break;
	}

	[$expr, $var] = explode(' -> ', $line);

	switch (1) {
		case preg_match('/^\w+$/', $expr):
			$wires[$var] = function() use ($expr) { return fetch($expr); };
			break;

		case preg_match('/\ANOT (\w+)\z/', $expr, $args):
			[, $arg] = $args;
			$wires[$var] = function() use ($arg) { return ~fetch($arg); };
			break;

		case preg_match('/^(\w+) ([A-Z]+) (\w+)$/', $expr, $args):
			[, $lhs, $fn, $rhs] = $args;
			switch ($fn) {
				case 'AND':
					$wires[$var] = function() use ($lhs, $rhs) { return fetch($lhs) & fetch($rhs); };
					break;

				case 'OR':
					$wires[$var] = function() use ($lhs, $rhs) { return fetch($lhs) | fetch($rhs); };
					break;

				case 'LSHIFT':
					$wires[$var] = function() use ($lhs, $rhs) { return (fetch($lhs) << fetch($rhs)) & 0xffff; };
					break;

				case 'RSHIFT':
					$wires[$var] = function() use ($lhs, $rhs) { return fetch($lhs) >> fetch($rhs); };
					break;

				default:
					die("bad fn '$fn'.");
			}

			break;
		default:
			die("bad expr '$expr'.");
	}
}

$orig = array_merge([], $wires);

$part1 = $wires['a']();
$wires = $orig;
$wires['b'] = $part1;
$part2 = $wires['a']();

echo "Part 1: $part1\nPart 2: $part2\n";
