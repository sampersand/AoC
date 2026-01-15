CWD =: (<./CWD i:'/\') {.CWD=: ;(4!:3''){~4!:4 CWD=: <'CWD'
raw =: }: freads CWD , '/day3.txt'
die =: {{ echo y throw. }}

NB. raw =: 'R75,D30,R83,U83,L12,D49,R71,U7,L72' , LF , 'U62,R66,U55,R34,D71,R55,D58,R83'


translate =: (". @ }.) * 0j1^('RULD' i. {.)

lines =: (translate every @ (','&cut)) each cutLF raw

coord_range =: (>: @ i. @ |) * ([ % |) 
move_line =: {{
	current =. 0
	positions =. ''
	for_coord. >y do.
		positions =. positions , current + coord_range coord
		current =. current + coord
	end.
	positions
}}

setintersect =: e. # [
distance =: +/ @ +.

distance setintersect/ move_line"0 lines

