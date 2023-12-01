CWD =: (<./CWD i:'/\') {.CWD=: ;(4!:3''){~4!:4 CWD=: <'CWD'
raw =: }: freads CWD , '/day2.txt'
die =: {{ echo y throw. }}

ints =: ". every ',' cut raw


number_of_params =: { & ((_ 3 3) , (_ * i.96) , 0) 

clock_cycle =: {{
	'ip memory' =. y
	instruction =. ip { memory
	params =. (ip + >: i. number_of_params instruction) { memory
	ip =. ip + >: #params

	select. instruction
	case. 1  do. memory =. (+/ }:params { memory) ({:params) } memory
	case. 2  do. memory =. (*/ }:params { memory) ({:params) } memory
	case. 99 do. ip =. >:#memory
	case. do. die 'unknown opcode: ' , ":instruction
	end.

	ip ; memory
}}


compare =: {{ a < #b [ 'a b' =. y }}
run =: {{
	y =. x (1 2) } y NB. replace the noun and verb
	{.>{: clock_cycle ^: compare ^:_ (0;y)
}}

part2 =: {{
	for_noun. i.100 do.
		for_verb. i.100 do.
			if. x = (noun ,verb) run y do.
				echo verb + noun * 100 
				return.
			end.
		end.
	end.
}}

echo 12 2 run ints
echo 19690720 part2 ints

