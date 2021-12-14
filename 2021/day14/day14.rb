$stdin = open('day14.txt')

start = gets.chomp
gets # delete the empty lien

XFORMS = {}
$stdin.each_line do |line|
  line =~ /(\w+) -> (\w+)/
  XFORMS[$1] = $2
end

groups = start.chars.each_cons(2).map(&:join).tally

40.times do
  new_groups = Hash.new 0

  groups.each do |g, c|
    if (x=XFORMS[g])
      new_groups[g[0]+x] += c
      new_groups[x+g[1]] += c
    else
      new_groups[g] += c
    end
  end

  groups.replace new_groups
end

counts = Hash.new 0
groups.each do |k, c|
  counts[k[0]] += c
  counts[k[1]] += c
end
counts[start[0]] += 1 # manually add first and last values
counts[start[-1]] += 1
counts.transform_values! { _1 / 2 }

puts counts.map(&:last).minmax
