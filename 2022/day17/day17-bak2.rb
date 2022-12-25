require 'set'
$stdin = open 'day17.txt'
# $stdin = DATA
# jets = $stdin.read.chomp.bytes.map { _1 - ?=.ord }

jets = '>>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>'.bytes.map { _1 - ?=.ord }

def disp_set(n)
  list = []
  n.each do |l| (list[l.imag] ||= [])[l.real] = '#' end
  list.map! { |x| (x || [nil]).map! { _1 || '.' } }
  puts list.map(&:join).reverse
end

ROCKS = [
  Set[0, 1, 2, 3],
  Set[1, 0+1i, 1+1i, 2+1i, 1+2i],
  Set[2, 2+1i, 2i, 1+2i, 2+2i],
  Set[0, 1i, 2i, 3i, 4i],
  Set[0, 1, 1i, 1+1i],
]

def rock_intersect?(grid, rock)
  grid.any? { |e| rock.any? e }
end

def add_rock(grid, rock)
  rock.each { grid.add? _1 or fail }
end

def push_jet(rock, jet)
  potential = rock.map { _1 + jet }
  potential.map(&:real).any? { _1 < 0 || _1 >= 7 } ? rock : potential
end

grid = Set[0,1,2,3,4,5,6,7]
jets = jets.cycle
ROCKS.cycle.first(2).each do |rock|
  topmost_rock = grid.map(&:imag).max||0
  rock = rock.map { _1 + topmost_rock.i + 2 + 3i }

  1000.times do |x|
    rock2 = push_jet(rock, jets.next)
    puts "--"
    disp_set add_rock(grid.dup, rock)
    puts "--"
    if rock_intersect?(grid, rock2)
      add_rock(grid, rock)
      break
    end
    rock = rock2

    rock2 = rock.map { _1 - 1i }
    if rock_intersect?(grid, rock2)
      add_rock(grid, rock)
      break
    end
    rock = rock2
    fail if x > 100
  end


    p grid
  disp_set grid
end

puts grid
# ROCKS.each { disp_set _1; puts }
# disp_set ROCKS[4]
