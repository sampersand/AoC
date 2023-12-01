CWD =: (<./CWD i:'/\') {.CWD=: ;(4!:3''){~4!:4 CWD=: <'CWD'
raw =: }: freads CWD , '/day3.txt'
die =: {{ echo y throw. }}
NB. =========================================================

raw =: 'R75,D30,R83,U83,L12,D49,R71,U7,L72' , LF , 'U62,R66,U55,R34,D71,R55,D58,R83'
raw =: 'R3,D4,U5,L2' , LF , 'D3,U4,R5'

translate =: (". @ }.) * 0j1^('RULD' i. {.)
lines =: (translate every @ (','&cut)) each cutLF raw

unit_direction_vector =: [ % |
unit_range            =: >: @ i. @|
coord_range           =: unit_range * unit_direction_vector

previous_ending_position =: {: @ [
move_single_line         =: [ , (previous_ending_position + coord_range@])

left_fold    =: {{ u~/ |. y }} NB. `/` is right fold.
stitch_index =: [ ,. i.@#
movelines    =: {{ }. stitch_index move_single_line left_fold 0, y }}"1

NB. =========================================================

answer =: movelines >lines
echo answer
NB. echo (e. # [) answer
