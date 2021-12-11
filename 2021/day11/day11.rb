$stdin = open('day11.txt')

GRID={}
$stdin.each_with_index do |l, x|
  l.chomp.each_char.each_with_index do |c, y|
    GRID[x + y.i] = c.to_i
  end
end

sum = 0
(1..).each do |gen|
  # add 1 to everything, then find the values to flash.
  GRID.transform_values!(&:succ)

  # While there's still things left to flash
  until (xform = GRID.select { _2 && _2 > 9 }).empty?
    xform.each_key do |key|
      GRID[key] = nil # mark the current one as flashed

      [-1-1i, -1, -1+1i, -1i, 1i, 1-1i, 1,1+1i]
        .map { key + _1 }
        .select(&GRID) # find neighbors
        .each { GRID[_1] += 1 } # flash each neighbor
    end
  end

  # Reset all flashes, then count how many times we flashed.
  sum += GRID.transform_values! { _1 || 0 }.values.count(&:zero?)
  
  if gen == 100
    puts "part1: #{sum}" 
  elsif GRID.values.uniq == [0]
    puts "part2: #{gen}" 
    break
  end
end
