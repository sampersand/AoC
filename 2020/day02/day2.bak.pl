no warnings;
open STDIN,'day2.txt'; # Omit if reading from stdin

$[=1;for(<>){
	m/^(\d+)-(\d+) (.): /;
	$o++if substr($',$1,1)eq$3^substr($',$2,1)eq$3;
	$m=$1;$x=$2;$_=$';
	$z=s/$3//g;
	$t++if grep{$_==$z}$m..$x
}print"$t\n$o\n";

=FINISH

            XXXXXXXXXXXXXXXX
           XX Please fix my XX
 XXXXXX    XX  passwords!   XX    XXXXXX
 XXXXXX  XXXXXXXXXXXXXXXXXXX      XXXXXX 
 XXXXXX                        XX XXXXXX 
   XX XX     XXXXXXXXXXXXXXXXXXX    XX   
 XXXXXX     X  Uhh ok?        X   XXXXXX 
XX XX        XXXXXXXXXXXXXXXXX   XX XX XX
   XX                               XX   
  XXXX                             XXXX  
 XX  XX                           XX  XX 
XX    XX                         XX    XX
