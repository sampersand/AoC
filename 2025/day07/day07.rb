$* << 'input.txt' if $*.empty?

MEMO = {}
LINES = $<.to_a(chomp: true)

def chase(pos, row)
  return 0 if LINES[row].nil?

  MEMO[[pos, row]] ||= begin
    case LINES[row][pos]
    when '.' then chase(pos, row+1)
    when '^'
      $part1 += 1
      chase(pos-1, row+1) + chase(pos+1, row+1) + 1
    end
  end
end

$part1 = 0
part2 = 1 + chase(LINES.shift.index('S'), 0)
puts $part1, part2
