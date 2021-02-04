# Day 7 in perl.
open A,"day7.txt";
for(<A>){s/\W|bags?|contain//g,s/(\d+)(\D+)/ \2 \1/g,my($k,%k)=split;$B{$k}=\%k}
sub ch{$B{$_}{$_[0]}&&ch($ch{$_}=$_)for keys%B;keys%ch}
sub bc{my$c,my%v=%{$B{$_}};$c+=&bc*$v{$_}for%v;$c+1}
print"Part 1: ",0+ch($x=shinygold),"\nPart 2: ",bc($_=$x),"\n"
