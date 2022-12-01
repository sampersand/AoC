#!ruby -n
BEGIN{$stdin = open './day3.txt'}

gsub /2/,'\&\&'
print

