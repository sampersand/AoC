require 'matrix'
require 'set'

$stdin = DATA

init_grove = {}
$stdin.each_with_index do |line, y|
  next if line =~ /##/
  y -= 1
  line.chomp[1..-2].each_char.with_index do |chr, x|
    init_grove[y.i + x] = Set[{'>'=>1,'<'=>-1,'^'=>-1i,'v'=>1i,'.'=>0}[chr] || next]
  end
end


MAX_X = init_grove.keys.map(&:real).max
MAX_Y = init_grove.keys.map(&:imag).max

def next_state(grove)
  new_grove = grove.transform_values{Set[]}
  grove.each do |position, direction|
    direction.each do |dir|
      new_grove[position + dir] << dir
    rescue
      new_grove[position.imag.i] += direction.real
    end

    begin
      new_grove[position + direction.imag.i] += direction.imag.i
    rescue
      new_grove[position.real + 0i] += direction.imag.i
    end
  end
  new_grove
end
pp (q = init_grove).select { _2 != 0 }
pp (q = next_state(q)).select { _2 != 0 }
pp (q = next_state(q)).select { _2 != 0 }
pp (q = next_state(q)).select { _2 != 0 }
pp (q = next_state(q)).select { _2 != 0 }

# def next_state(grove)
#   new_grove = 
# p init
# __END__
# #.######
# #>>.<^<#
# #.<..<<#
# #>v.><>#
# #<^v^^>#
# ######.#
__END__
#.#####
#.....#
#>....#
#.....#
#...v.#
#.....#
#####.#
