require 'set'
input = open('day8.txt').map { |x| x.chomp.split('|').map { |x| x.split.map(&:chars).map(&:to_set) } }

def solve((line, out))
  line = line.group_by(&:size)

  real = {
    1 => r1=line[2].first,
    7 => line[3].first,
    4 => r4=line[4].first,
    8 => line[7].first,
  }

  real.update(
    6 => line[6].find { not _1 > r1 },
    9 => line[6].find { _1 > r4 },
    0 => line[6].find { _1 > r1 and not _1 > r4 },
    3 => line[5].find { _1 > r1 },
    2 => line[5].find { (_1 & r4).size == 2 },
    5 => line[5].find { (_1 & r4).size == 3 and not _1  > r1 }
  )

  real = real.invert
  out.map(&real).map(&:to_s).join.to_i
end

p input.map { |x| solve x }.sum
