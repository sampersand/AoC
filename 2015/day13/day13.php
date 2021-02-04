<?php

$file = fopen('day13.txt', 'r') or die('cant read file');

$invitees = [];

while (!feof($file)) {
	if (!preg_match("/(\w+) would (lose|gain) (\d+) happiness units by sitting next to (\w+)/", fgets($file), $matches)) {
		break;
	}

	$invitees[$matches[1]][$matches[4]] = ($matches[2] == 'lose' ? -1 : 1) * intval($matches[3]);
}

function hapiness(array $invitees, array $ordering): int {
    $ret = 
}

print_r($invitees);
// function permutations($array) {
// 	$ret = [];
// 	$count = count($array)
// function permutations($array) {
//     $list = array();
 
//     $array_count = count($array);
 
//     $number_of_permutations = 1;
//     if ($array_count > 1) {
//         for ($i = 1; $i <= $array_count; $i++) {
//             $number_of_permutations *= $i;
//             echo $number_of_permutations . ' ' . $i . "\n";
//         }
//     }
 
//     for ($i=0; count($list) < $number_of_permutations; $i++) {
//         shuffle($array);
//         $tmp = implode(',', $array);
//         if (!isset($list[$tmp])) {
//             $list[$tmp] = 1;
//         }
//     }
 
//     ksort($list);
//     $list = array_keys($list);
//     return $list;
// }

 
 
// print_r(count($invitees));
// print_r($invitees);
// pc_permute
