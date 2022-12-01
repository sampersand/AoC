#!ruby -n
BEGIN{$stdin=open'day4.txt'}

BEGIN{a=b=0}

a+=1if[]|(x=$_.split)==x
b+=1if x.uniq{_1.chars.sort*""}==x

END{p [a,b]}
