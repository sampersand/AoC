lines = open('day8.txt').each_line.map(&:split)

def valid(lines, acc=0, i=-1)
	while i != lines.length - 1
		case (line=lines[i += 1])&.first
		when nil then return false
		when 'nop' then
			lines[i] = nil
		when 'acc' then
			lines[i] = nil
			acc += line[1].to_i
		when 'jmp' then 
			lines[i] = nil
			i += line[1].to_i - 1
		end
	end

	return i
end

lines.length.times do |x|
	l = lines.map(&:dup)

	if l[x].first == 'jmp'
		l[x][0] = 'nop'
	elsif l.first == 'nop'
		l[x][0] = 'jmp'
	else
		next
	end

	if (x=valid l)
		p x
	end
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
