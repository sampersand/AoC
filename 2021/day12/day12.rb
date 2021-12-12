GRID = Hash.new { |h,k| h[k] = [] }

open('day12.txt').each do |x|
  /(?<l>\w+)-(?<r>\w+)/ =~ x
  GRID[l].push r
  GRID[r].push l
end

def gothru(start, part2, sofar=[], ignore=nil)
  return [[start]] if start == 'end'

  acc = []

  if start =~ /[a-z]/
    return [] if sofar.include?(start) && ignore

    if !ignore && start != 'start' && part2
      acc.concat (GRID[start] - sofar).flat_map { gothru _1, part2, sofar, true }
    end

    sofar += [start] # creates a new array to not mess with caller
  end

  acc.concat (GRID[start] - sofar).flat_map { gothru _1, part2, sofar, ignore }

  acc.each { _1.prepend start }
end

puts "part1: #{gothru('start', false).uniq.size}"
puts "part2: #{gothru('start', true).uniq.size}"
