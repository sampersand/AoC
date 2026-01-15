$* << 'sample.txt' if $*.empty?
# $* << 'input.txt' if $*.empty?

GRIDS = {}
DATA #$<
.each do |line|
  line =~ /(\w+): /
  GRIDS[$1] = $'.split
end

$memo = {}
def compute_duration(current, target)
  $memo[target] = 1
  $memo[current] ||= begin
    GRIDS[current].map do |child|
      p compute_duration(child, target)
    end.reduce :*
  end
    # compute_duration(current)
end

compute_duration 'hhh', 'out'
p $memo
pp GRIDS

__END__
aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out
