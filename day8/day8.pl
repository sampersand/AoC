# Day 8 in perl.
# We build up a program and then `eval` it. GOTOs considered good.
# To swap between nop and jmp, we change the '#' to 'g'.
open A,'day8.txt';
y/nj\n/#g /,s/.*/_$.:\$L{$.}++&&(y|#g|g#|,next);$_);\n/,s/acc/\$a+=(/||s/;(.)../;$1oto'_'.($.+/,push@l,$_ while<A>;
%L=$a=0,y/#g/g#/,eval"@l",last for@l;print"Part2: $a"

;
=begin
Since Perl has `goto` ('cause, yknow, why wouldn't it?), I decided to build up the program and then evaluate it. Here's an example of what the built up code looks like that we evaluate: 
```pl
_1:$L{1}++&&next;#oto'_'.(1+ +0 );
_2:$L{2}++&&next;$a+=( +1 );
_3:$L{3}++&&next;goto'_'.(3+ +4 );
_4:$L{4}++&&next;$a+=( +3 );
_5:$L{5}++&&next;goto'_'.(5+ -3 );
_6:$L{6}++&&next;$a+=( -99 );
_7:$L{7}++&&next;$a+=( +1 );
_8:$L{8}++&&next;goto'_'.(8+ -4 );
_9:$L{9}++&&next;$a+=( +6 );
```
To swap between `nop` and `jmp`, we change the `#` to `g` and toggle the comment.
=cut

__END__
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
