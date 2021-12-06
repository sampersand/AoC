INPUT = open('day6.txt', &:read).split(',').map(&:to_i)

def solve(times)
  map = INPUT.tally

  times.times do
    map.transform_keys!(&:pred)
    extra = map.delete(-1) || 0
    map[8] = extra
    map[6] += extra
  end

  map.sum(&:last)
end

puts solve 80
puts solve 256

BEGIN { class Array; def tally; each_with_object(Hash.new 0) { |k,h| h[k] += 1} end end }
