$stdin = open('day19.txt')

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

ARGF.count { rules =~ _1 }.tap(&:display)
