CWD =: (<./CWD i:'/\') {.CWD=: ;(4!:3''){~4!:4 CWD=: <'CWD'
raw =: }: freads CWD , '/day3.txt'
die =: {{ echo y throw. }}

raw =: 'R75,D30,R83,U83,L12,D49,R71,U7,L72' , LF , 'U62,R66,U55,R34,D71,R55,D58,R83'
raw =: 'R3,D4,U5,L2' , LF , 'D3,U4,R5,L3'

translate =: (". @ }.) * 0j1^('RULD' i. {.)
lines =: (translate every @ (','&cut)) each cutLF raw


coord_range =: (>: @ i. @ |) * ([ % |)
moveit =: [ , ({:@[) + (coord_range@])
q =: moveit~/ (|.) 0 , l
echo }. ([ ,. i.@#) q

move_line =: {{
	pos =. 0

	for_coord. >y do.
		pos =. pos , ({:pos) + coord_range coord
	end.

	}. ([ ,. i.@#) pos
}}
NB.
echo '--'
echo move_line {: lines
