lines = DATA.to_a

def valid?(lines)
	acc = rip = 0

	while rip != lines.length - 1
		l, lines[rip] = lines[rip], nil
		rip += 1

		case l
		when nil then return
		when /nop/ then next
		when /acc/ then acc += $'.to_i
		when /jmp/ then rip += $'.to_i - 1
		end
	end

	rip
end

lines.length.times do |x|
	l = lines.map(&:dup)
	l[x].tr!('jmpnop', 'nopjmp')
	valid?(l)&.tap { puts _1; exit }
end

__END__
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
