require_relative '../submitter'
require 'set'
$stdin = DATA

grid = Set.new
$stdin.each do |line|
  line.gsub!(/,(\d+)/, '+\1i')

  prev = nil
  line.scan /(\S*) -> (\S*)/ do |data|
    x = eval($1) || prev
    prev = y = eval $2
    dir = ((q = y - x).real <=> 0) + (q.imag <=> 0).i
    grid << x << y
    grid << x += dir until x == y
  end
end

10.times do
  pos = 500
  100000.times do 
    if !grid.include? pos + 1i
      pos += 1i
      next
    end

    unless grid.include? 
  changed = false
  while !grid.include?(pos.imag) && ($x += 1) < 100000
    pos += 1i
    changed = true
  end
  if chanded

end
p grid



__END__
498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9
