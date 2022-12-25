require 'set'
$stdin = open 'day17.txt'
# $stdin = DATA
jets = $stdin.read.chomp.bytes.map { _1 - ?=.ord }

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
  grid.any? { |e| rock.any? e }
end

def add_rock(grid, rock)
  rock.each { grid.add? _1 or fail }
  grid
end

def push_jet(rock, jet)
  potential = rock.map { _1 + jet }
  potential.map(&:real).any? { _1 < 0 || _1 >= 7 } ? rock : potential
end

grid = Set[0,1,2,3,4,5,6]
jets = jets.cycle

topmost_rock = 0i
ROCKS.cycle.first(2022).each do |rock|
  rock = rock.map { _1 + topmost_rock + 2 + 4i }

  loop do
    rock2 = push_jet(rock, jets.next)

    rock = rock2 unless rock_intersect?(grid, rock2)
    rock2 = rock.map { _1 - 1i }
    
    if rock_intersect?(grid, rock2)
      topmost_rock = [topmost_rock, rock.map(&:imag).max.i].max_by(&:imag)
      add_rock(grid, rock)
      break
    end
    rock = rock2
  end
end

disp_set grid
puts topmost_rock
# require_relative '../submitter'
# download! 2022, 17
# submit! grid.map(&:imag).max

# puts grid
# ROCKS.each { disp_set _1; puts }
# disp_set ROCKS[4]
