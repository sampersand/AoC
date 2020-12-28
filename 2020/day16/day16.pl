# DAY 16. We had to figure out our tickets.
open STDIN,"day16.txt"; # Omit if reading from stdin

        $/=''
        ;for(                                            split"\n",<>){my($l,
        $x,$y                       ,$z,                 $w)=/([^:]+):\s(\d
  +)-(\d+)\sor\s(\d+)-(\d+)/x;$R{$l}=sub{$q=shift;+$x<=$q&&$q<=$y||$z<=$q
 &&$q<=$w};};@C=map{[]}0..$#{[@M=split",",${[split"\n",<>]}[1]]};@t=split
 "\n",<>;shift@t;for$t(map{[split',']}@t){@t=@$t;for$f(@t){grep{$_->($f)}
  values%R or$s+=$f,goto d}push$C[$_],$t[$_]for 0..$#t;d:}print"Part 1: $
     s\n";for(0..$#C){@c=@{$C[$_]};$m=[];for$k(keys%R){$R{$k}->($_)||goto
    nm for@c;push$m,$k;nm:}$T{$_}=$m}$s{$a{$_}=$x=${[grep{!exists$s{$_}}@
{$T{$_}}]}[0]}=1 for sort{$#{[@{$T{$a}}]}<=>$#{[@{$T{$b}}]}}keys%T;$S=01;$a{$_}
=~/departure/ and$S*=$M[$_]for keys%a;print"Part 2: $S\n";print join"",map{chr
   $_}0102,121        ,040,83,97,        109,112,101        ,0162,0163,
      +97,11*           10.0,10            **2,###            #######

