$stdin = open('day14.txt')

START = gets.chomp.chars.each_cons(2).map(&:join).tally
gets # delete the empty line
XFORMS = $stdin.map { _1.chomp.split ' -> ' }.to_h

def solve(amnt)
  groups = START

  amnt.times do
    newgroups = Hash.new 0
    groups.each do |grp, c|
      x=XFORMS[grp]
      newgroups[grp[0]+x] += c
      newgroups[x+grp[1]] += c
    end
    groups = newgroups
  end

  counts = Hash.new 0
  groups.each do |k, c|
    counts[k[0]] += c
    counts[k[1]] += c
  end

  ~counts.map { _2 / 2 }.minmax.reduce(&:-)
end

puts solve 10
puts solve 40
