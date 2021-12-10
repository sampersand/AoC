$stdin=open 'day5.txt'

LINES = $stdin.map { |line|
  line.scan(/(\d+),(\d+)/).map { Complex(_1, _2) }
}

def solve(part1)
  map = Hash.new 0

  LINES.each do |(tl, br)|
    dir = (br.real<=>tl.real) + (br.imag<=>tl.imag).i

    if part1 && !(br.real==tl.real || br.imag == tl.imag)
      next
    end

    map[tl] += 1
    map[tl += dir] += 1 until tl == br
  end

  map.values.count { 2 <= _1 }
end

puts "part 1: #{solve true}"
puts "part 1: #{solve false}"
