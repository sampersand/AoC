require 'z3'
$* << 'sample.txt' if $*.empty?
# $* << 'input.txt' if $*.empty?

$MEMO = {}
def toggle(joltages, buttons)
  j = joltages.dup
  buttons.bit_length.times do |x|
    j[x] -= 1 unless buttons[x].zero?
  end
  return nil if j.any?(&:negative?)
  j
end

def findit(joltages, buttons)
  solver = Z3::Solver.new
  vars = buttons).map(&:bit_length).max
  exit
  p [joltages, buttons]
  exit
end
def findit2(joltages, buttons, depth=0)
  fail if depth > 100

  if $MEMO.key? joltages
    return $MEMO[joltages]
  end

  # p $MEMO
  $MEMO[joltages] = Float::INFINITY
  $MEMO[joltages] = begin
    x = buttons.filter_map do |button|
      sub = toggle(joltages, button) or next Float::INFINITY
      # p [sub, button, joltages, depth]
      q = findit(sub, buttons, depth+1) #or next
      q + 1
    end
    # p [buttons, joltages, x]
    # p x
    # p [target, buttons, depth, x]
    x.min
  end
end

sum = 0
$<.each do |line|
  /\[(.*?)\] (.*) \{(.*)\}/ =~ line or fail
  target = $1.each_char.with_index.filter_map { _1 == '#' and _2 }
  joltages = $3.split(',').map(&:to_i)
  buttons = $2.split.map{it[/\((.*)\)/, 1].split(',').map(&:to_i)}
  target = target.sum { 1 << it}
  buttons = buttons.map { |b| b.sum{1 << it}}
  # buttons.sort_by! { ("%010b" % it).count '1' }.reverse!
  # puts buttons.map { "%0b" % it }

  $MEMO[[0]*joltages.length] = 0
  sum += (q = findit(joltages, buttons)) rescue (
    p "bad: #{line} #$!"
    exit)
  $MEMO.clear
  p [q, line]
  exit
  # p $MEMO
  # exit
end
p sum
__END__

[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
