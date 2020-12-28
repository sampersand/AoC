# Day 17, in perl.
# We had to solve a game of life in 4 d.
open STDIN, 'day17.txt'; # Omit this line if reading from stdin


                while(<>){$x=chomp;for(split''){
              $x++,                        "#"eq
            +$_ and                      $;= $"=
          ","   ,$T                    {$x   ,$.
        ,0,     0}=                  1}}     for
      $P(       1,2                ){%       C=%
    T;;         if(              1==         $P)
 {%K=           ();            for           ((+
%C)){@_=S($;);pop@_;$K{"@_"}=$C{             $_}
};%             C=%          K;}             for
(00             ..5          ){%             H=(
);;             for          (%C             ){$
H{+             $_}          ++,             000
for             (glob+join$;,map{"{@{[$_-1..$_+1
]}}"            }S(          $;)             )}%
K=(           );(            $x=           $H{
$_}         )==              3||         4==
+$x       &&$                C{+       $_}
and     $K{                  $_}     =01
for   %H;                    %C=   %K}
P(+ +"$                      P.: ",-
-keys                        +%C,"
");sub S{split@_}sub P{print@_}}
