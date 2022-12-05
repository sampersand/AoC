$stdin = open 'input.txt'

crates = $stdin
  .gets("\n\n")
  .lines[..-3]
  .map { _1.scan(/.(.)../m).flatten }
  .transpose
  .map { _1.grep_v(' ') }

crates2 = crates.map(&:dup)

$stdin.each do |line|
  /move (\d+) from (\d+) to (\d+)/ =~ line or next
  amnt = $1.to_i
  from = $2.to_i - 1
  to = $3.to_i - 1

  crates[to].concat crates[from].shift(amnt)
  crates2[to].prepend *crates2[from].shift(amnt)
end

p crates.map(&:first).join
p crates2.map(&:first).join

