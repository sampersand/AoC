raw =: 'LLRRLLRLDDUURLLRDUUUDULUDLUULDRDDDULLLRDDLLLRRDDRRUDDURDURLRDDULRRRLLULLULLRUULDLDDDUUURRRRURURDUDLLRRLDLLRRDRDLLLDDRRLUDDLDDLRDRDRDDRUDDRUUURLDUDRRLULLLDRDRRDLLRRLDLDRRRRLURLLURLRDLLRUDDRLRDRRURLDULURDLUUDURLDRURDRDLULLLLDUDRLLURRLRURUURDRRRULLRULLDRRDDDULDURDRDDRDUDUDRURRRRUUURRDUUDUDDDLRRUUDDUUDDDUDLDRDLRDUULLRUUDRRRDURLDDDLDLUULUDLLRDUDDDDLDURRRDRLLRUUUUDRLULLUUDRLLRDLURLURUDURULUDULUDURUDDULDLDLRRUUDRDDDRLLRRRRLDRRRD'

NB. src =: <"0 each ;: raw
src =: ;: raw

board =: 3 3 $ >:i.9
translate =: {{
	select. y
	case. 'U' do. 0j1
	case. 'D' do. -0j1
	case. 'L' do. -1
	case. 'R' do. 1
	end.
}}

punch =: {{
	pos =. 1j1
	for_i. translate"0 y do.
		'q r' =. +. (i+pos)
		if. (q < 0) +. (q >: }. $ board) do. continue. end.
		if. (r < 0) +. (r >: {. $ board) do. continue. end.
		
		if. 0 = (<q;r) { board do. continue. end.
		pos =. q j. r
	end.
	echo pos
}}

punch raw
NB. punch each src
