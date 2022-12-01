#!ruby -n

(x=$_.split)==x.uniq{_1.chars.sort*''}&&
b+=%|   * * * * * * * * * * * * *   |&&1
a+=1if[]|x==x;;BEGIN{a=b=0};END{p [a,b]}

END{fail unless [455,186] == [a,b]}


BEGIN{$stdin=open'day4.txt'}
