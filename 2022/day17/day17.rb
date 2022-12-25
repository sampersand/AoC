require 'set'
$stdin = open 'day17.txt'
# $stdin = DATA
jets = $stdin.read.chomp.bytes.map { _1 - ?=.ord }

# jets = '>>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>'.bytes.map { _1 - ?=.ord }

def disp_set(n)
  list = []
  n.each do |l| (list[l.imag] ||= [])[l.real] = '#' end
  list.map! { |x| (x || [nil]).map! { _1 || '.' } }
  puts list.map(&:join).reverse[..-2].reverse
end

ROCKS = [
  Set[0, 1, 2, 3], # -
  Set[1, 0+1i, 1+1i, 2+1i, 1+2i], # +
  # Set[2, 2+1i, 2i, 1+2i, 2+2i], # L rev
  Set[0, 1, 2, 2+1i, 2+2i], # L rev
  Set[0, 1i, 2i, 3i], # |
  Set[0, 1, 1i, 1+1i], # []
]

def rock_intersect?(grid, rock)
  rock.any? { grid.include? _1 }
end

def push_jet(rock, jet)
  potential = rock.map { _1 + jet }
  potential.map(&:real).any? { _1 < 0 || _1 >= 7 } ? rock : potential
end

grid = 7.times.map{_1+0i}.to_set
# jets = jets.cycle

cycle = {}#Hash.new 0
topmost_rock = 0
jetidx = -1
rockidx = 0
while rockidx < 1000000000000 # 2022.*(2)
  rock = ROCKS[rockidx % ROCKS.length]
  rock = rock.map { _1 + topmost_rock.i + 2 + 4i }

  loop do
    jetidx = (jetidx + 1) % jets.length
    jet = jets[jetidx]
    rock2 = push_jet(rock, jet)

    rock = rock2 unless rock_intersect?(grid, rock2)
    rock2 = rock.map { _1 - 1i }

    if rock_intersect?(grid, rock2)
      topmost_rock = [topmost_rock, rock.map(&:imag).max].max
      grid.merge rock
      full_lines = rock.map(&:imag).uniq.select { |r| 7.times.all? { grid.include? _1 + r.i } }
      break if full_lines.empty?
      break if (q=(cycle[[jetidx, rockidx % ROCKS.length]]||=[]) << zx).length <= 1
      diff = q[1] - q[0]
      t = 1000000000000
      rockidx = (((t - diff) / diff) * diff)
      cycle.clear
      # p rockidx + (((t - diff) / diff) * diff)
      # exit
      # p t - ((t - rockidx) / diff) * diff
      # p rockidx

      rockidx
      p q
      exit
      break
    end
    rock = rock2
  end

  rockidx += 1
end

disp_set grid
puts topmost_rock
p cycle.max_by { _2.length }
