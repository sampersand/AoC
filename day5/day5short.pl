# Day 5 in perl.
# Newlines are optional, and are used to make it slightly more palatable
y/BRFL/1100/,push@a,oct"0b$_"for<>;
@ARGV=sort{$a<=>$b}@a;@_{shift..($_=pop)}=1,delete@_{@a},
print"$_\n",%_
