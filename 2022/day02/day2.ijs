findme=: {{ ({.~ <./@i:&'/\')(4!:4<'findme'){::4!:3'' }}
raw =: freads (findme '') , '/input.txt'

M =: 3 3 $  4j3 8j4 3j8 1j1 5j5 9j9 7j2 2j6 6j7
lines =: >LF cut raw
getindex =: {{
	<('ABC' i. {. y) , ('XYZ' i. {: y)
}}

+/ (M {~ getindex)"1 lines
