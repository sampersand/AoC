raw =: fread '/Users/sampersand/code/aoc/2016/day2/day22.txt'
NB. raw =: 'ULL RRDDD LURDL UUUUD'

src =: ;: raw

translate =: {{
	select. y
	case. 'U' do. -1
	case. 'D' do. 1
	case. 'L' do. -0j1
	case. 'R' do. 0j1
	case. do. 0
	end.
}}

inbounds =: {{
	'q r' =. +. y
	if. (q < 0) +. (q >: }. $ board) do. 0 return. end.
	if. (r < 0) +. (r >: {. $ board) do. 0 return. end.

	(<q;r) { board
}}

punch =: {{
	for_i. translate"0 y do.
		new =. i + pos
		if. inbounds new do. pos =: new end.
	end.
	pos
}}

lookup =: {{ (<;+.y) { board }}

play =: {{
	pos =: x
	board =: y
	lookup each punch each src
}}

1j1 play 3 3 $ >:i.9

2 play 5 5 $ 0 0 1 0 0 0 2 3 4 0 5 6 7 8 9 0 0.1 0.2 0.3 0 0 0 0.4 0 0
