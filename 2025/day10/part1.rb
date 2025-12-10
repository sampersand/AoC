# $* << 'sample.txt' if $*.empty?
$* << 'input.txt' if $*.empty?

$MEMO = {}
def findit(target, buttons, depth=0)
  $MEMO[0] = 0

  if $MEMO.key? target
    return $MEMO[target]
  end

  $MEMO[target] = Float::INFINITY
  $MEMO[target] = begin
    x = buttons.filter_map do |button|
      # p [target, button, target ^ button ,depth]
      q = findit(target ^ button, buttons, depth+1) #or next
      q + 1
    end
    # p x
    # p [target, buttons, depth, x]
    x.min
  end
end
# p findit 0b11, [0b11, 0b10]
# exit

sum = 0
$<.each do |line|
  /\[(.*?)\] (.*) \{(.*)\}/ =~ line or fail
  target = $1.each_char.with_index.filter_map { _1 == '#' and _2 }
  joltages = $3.split(',').map(&:to_i)
  buttons = $2.split.map{it[/\((.*)\)/, 1].split(',').map(&:to_i)}
  target = target.sum { 1 << it}
  buttons = buttons.map { |b| b.sum{1 << it}}

  sum += (q = findit(target, buttons)) rescue (
    p "bad: #{line} #$!"
    exit)
  $MEMO.clear
  p [q, line]
  # p $MEMO
  # exit
end
p sum
__END__

[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
