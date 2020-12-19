open STDIN, 'day19.txt';
# $stdin = DATA
# $stdin = open('day19.txt')
$/="\n\n";
$_=<>;
s/\d+:/$&/g;
print;
__END__
rules=gets("\n\n")
	.sub('8: 42','\& 8 | 42')
	.sub('11: 42 31', '\& | 42 11 31')
	.gsub(/\d+/,'\g<x\&>')
	.gsub(/\\g<x(\d+)>:(.*)$/, '(?<x\1>\2)')
	.gsub(/\s/,"")
	.gsub('"','')
	.gsub(/\A/,'(?=')
	.gsub(/\z/,')?\A\g<x0>\Z')
	.then { Regexp.new _1 }

ARGF.each_line.count { rules =~ _1 }
	.tap(&:display)
	# .split("\n")
	# .map {

	# 		_1
	# 		.gsub('|', ' x or (x=y) && ')
	# 		.gsub(/(\d+):/, '$rules[\1]=proc { |x| y=x; ')
	# 		.gsub(/(\d+)( |$)/, '(x=$rules[\1].call(x)) && ')
	# 		.gsub(/"(\w+)"/, '(x[0] == "\1" && x = x[1..]) &&') + ' x }' }
	# .join("\n")
# $rules[11]=proc { |x| y=x; 
# 	(x=$rules[42].call(x)) && ((x=$rules[31].call(x)) &&  x or
# 	(x=y) &&  (x=$rules[42].call(x)) && (x=$rules[11].call(x)) &&
# 	(x=$rules[31].call(x)) && x)
# }
# input = DATA.gets.split("\n")
# p input.select { ($rules[0].call(_1) || next).length.zero? }.length
# p $rules
# p input.
__END__
42: 9 14 | 10 1
9: 14 27 | 1 26
10: 23 14 | 28 1
1: "a"
11: 42 31
5: 1 14 | 15 1
19: 14 1 | 14 14
12: 24 14 | 19 1
16: 15 1 | 14 14
31: 14 17 | 1 13
6: 14 14 | 1 14
2: 1 24 | 14 4
0: 8 11
13: 14 3 | 1 12
15: 1 | 14
17: 14 2 | 1 7
23: 25 1 | 22 14
28: 16 1
4: 1 1
20: 14 14 | 1 15
3: 5 14 | 16 1
27: 1 6 | 14 18
14: "b"
21: 14 1 | 1 14
25: 1 1 | 1 14
22: 14 14
8: 42
26: 14 22 | 1 20
18: 15 15
7: 14 5 | 1 21
24: 14 1

abbbbbabbbaaaababbaabbbbabababbbabbbbbbabaaaa
bbabbbbaabaabba
babbbbaabbbbbabbbbbbaabaaabaaa
aaabbbbbbaaaabaababaabababbabaaabbababababaaa
bbbbbbbaaaabbbbaaabbabaaa
bbbababbbbaaaaaaaabbababaaababaabab
ababaaaaaabaaab
ababaaaaabbbaba
baabbaaaabbaaaababbaababb
abbbbabbbbaaaababbbbbbaaaababb
aaaaabbaabaaaaababaa
aaaabbaaaabbaaa
aaaabbaabbaaaaaaabbbabbbaaabbaabaaa
babaaabbbaaabaababbaabababaaab
aabbbbbaabbbaaaaaabbbbbababaaaaabbaaabba
