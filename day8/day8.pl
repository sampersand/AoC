# Day 8 in perl.
# We build up a program and then `eval` it. GOTOs considered good.
# To swap between nop and jmp, we change the '#' to 'g'.
open A,"day8.txt";
y/nj\n/#g /,s/.*/_$.:\$L{\$l=$.}++&&next;$_;\n/,s/acc/\$a+=/||
s/;(.)..(.*);/;$1oto _@{[$.+$2]};/,push@l,$_ while<A>;
for(0..$#l){%L=(),$l=$a=0,$l[$_]=~y/#g/g#/,eval"@l",last}
continue{$l[$_]=~y/#g/g#/}print"Part2: $a"

=begin
This one was extremely fun lol. Since Perl has `goto` ('cause, yknow, why wouldn't it?), I decided to build up the program and then evaluate it. Here's an example of what the built up code looks like that we evaluate: 
```pl
_1:$L{$l=1}++&&next;$a+= +15 ;
_2:$L{$l=2}++&&next;goto _463;
_3:$L{$l=3}++&&next;$a+= +6 ;
_4:$L{$l=4}++&&next;#oto _449;
_5:$L{$l=5}++&&next;goto _329;
_6:$L{$l=6}++&&next;goto _259;
_7:$L{$l=7}++&&next;$a+= -4 ;
_8:$L{$l=8}++&&next;$a+= +22 ;
_9:$L{$l=9}++&&next;$a+= +11 ;
_10:$L{$l=10}++&&next;goto _481;
```
To swap between `nop` and `jmp`, we change the `#` to `g` and toggle the comment.
=cut
