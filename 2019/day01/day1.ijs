CWD=: (<./CWD i:'/\') {.CWD=: ;(4!:3''){~4!:4 CWD=: <'CWD'
lines =: LF cut (freads CWD , '/day1.txt')

fuel =: {{ (<. y % 3) - 2 }}
part1 =: +/ (fuel & ".)"1 every lines

calc_fuel =: {{
	q =. fuel y
	if. q <: 0 do.
		0
	else.
		q + calc_fuel q
	end.
}}


echo part1
echo +/ calc_fuel"0 "."1 every lines
echo +/ (calc_fuel @: ".)"1 every lines