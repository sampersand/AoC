$stdin=open 'day5.txt'

LINES = $stdin.map do |line|
  line =~ /(\d+),(\d+) -> (\d+),(\d+)/
  [$1.to_i + $2.to_i.i, $3.to_i + $4.to_i.i]
end

def solve(part1)
  map = Hash.new 0
  LINES.each do |(tl,br)|
    dir = (br.real<=>tl.real) + (br.imag<=>tl.imag).i

    if part1 && !(br.real==tl.real || br.imag == tl.imag)
      next
    end

    map[tl] += 1
    map[tl += dir] += 1 until tl == br
  end

  map.count { |_,n| n >= 2 }
end

puts "part 1: #{solve true}"
puts "part 1: #{solve false}"
