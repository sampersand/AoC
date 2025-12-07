$* << 'input.txt' if $*.empty?
# $* << 'sample.txt' if $*.empty?

$MEMO = {}
def chase(pos, lines)
  return 0 if lines.empty?

  $MEMO[[pos, lines.length]] ||= begin
    line, *lines = lines
    case line[pos]
    when '.' then chase(pos, lines)
    when '^' then chase(pos-1, lines) + chase(pos+1, lines) + 1
    else fail "#{line[pos].inspect}"
    end
  end
end

data = $<.to_a(chomp: true)
result = chase(data.shift.index('S'), data) + 1
fail unless result == 187987920774390
