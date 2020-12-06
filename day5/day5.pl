# Day 5 in perl.
open A,"day5.txt";
y/BRFL/1100/,push@a,oct"0b$_"for<A>;
@ARGV=sort{$a<=>$b}@a;
@_{shift..($_=pop)}=1,delete@_{@a},print"$_\n",%_

