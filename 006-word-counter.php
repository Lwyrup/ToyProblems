<?php
$sentence = "It is rather for us, the living, we here be dedicated to the great task remaining before us.";
$arr = array(split($sentence, " "));
foreach ($arr as $part) {echo $part;}
print $arr


// $foo = array(); // New empty array.
// if(!$foo["is"]){
// 	$foo = array('a', 'b', 'c'); // Numeric index.
// 	$foo = array('a' => '1', 'a' => '2', 'c' => '3'); // Associative.
// }


// $words = new stdClass();
// $words->a = '1';
// $words->b = '2';
// $words->c = '3';

?>