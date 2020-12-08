def nop(*) end
def acc(x) @acc += x.to_i end
def jmp(x) @rip += x.to_i - 1 end

LINES = open('day8.txt').to_a + ['puts "Part 2: #@acc"; exit']

LINES.length.times do |target|
	next if LINES[target] == 'acc'

	lines = LINES.clone
	@acc = @rip = 0

	while (line, lines[@rip] = lines[@rip])
		eval target == (@rip += 1) ? line.tr('jmpnop', 'nopjmp') : line
	end
end
