<?php

$input = array_map('intval', explode("\n", file_get_contents('day17.txt')));

$a = ['a', 'b', 'c', 'd', 'e'];

shuffle($a);
ksort($a);
echo implode(';', $a);
// print_r(array_diff($a, ['a', 'b']));
// print_r($a);
print_r($a);
exit;
print_r($a);

exit;
function pour_eggnog($input, $memo=[]) {
	// foreach ($inpnut as $k => $value) {
	// 	# code...
	// }
	$memo[$input] = 3;
	return $memo;
}

print_r(pour_eggnog("Abc"));
print_r(pour_eggnog("def"));
exit;
print_r($input);
print_r(array(1, 2, 3) + array(5));
// $file = fopen('day13.txt', 'r') or die('cant read file');

// $invitees = [];

// while (!feof($file)) {
// 	if (!preg_match("/(\w+) would (lose|gain) (\d+) happiness units by sitting next to (\w+)/", fgets($file), $matches)) {
// 		break;
// 	}

// 	$invitees[$matches[1]][$matches[4]] = ($matches[2] == 'lose' ? -1 : 1) * intval($matches[3]);
// }
