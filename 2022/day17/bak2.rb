require 'set'
$stdin = open 'day17.txt'
# $stdin = DATA
jets = $stdin.read.chomp.chars

# jets = '>>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>'.bytes.map { _1 - ?=.ord }

def disp_set(n)
  list = []
  n.each do |l| (list[l.imag] ||= [])[l.real] = '#' end
  list.map! { |x| (x || [nil]).map! { _1 || '.' } }
  puts list.map(&:join).reverse[..-2]
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
  potential = rock.map { _1 + (jet.ord - ?=.ord) }
  potential.map(&:real).any? { _1 < 0 || _1 >= 7 } ? rock : potential
end

grid = 7.times.map{_1+0i}.to_set
jets = jets.cycle

topmost_rock = 0
ROCKS.cycle.first(2022).each do |rock|
  rock = rock.map { _1 + topmost_rock.i + 2 + 4i }

  loop do
    jet = jets.next
    rock2 = push_jet(rock, jet)

    rock = rock2 unless rock_intersect?(grid, rock2)
    rock2 = rock.map { _1 - 1i }

    if rock_intersect?(grid, rock2)
      topmost_rock = [topmost_rock, rock.map(&:imag).max].max
      grid.merge rock
      break
    end
    rock = rock2
  end
end

disp_set grid
puts topmost_rock
