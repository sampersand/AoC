position = 50
count = 0

for line in File.foreach('sample.txt')
  which  = line[0]
  amount = line[1..].to_i()

  printf 'start: %2d, moving %s by %2d. ', position, which, amount

  was_originally_zero = (position == 0)

  if which == 'L';    position -= amount
  elsif which == 'R'; position += amount
  elsif which == 'Q'; break
  else                abort("oops, bad which: #{which}") end

  printf "[%3d] ", position

  if position == 0
    count += 1
  elsif position < 0
    if was_originally_zero
      count -= 1
    end

    while position < 0
      position += 100
      count += 1
    end
  elsif position >= 100
    while position >= 100
      position -= 100
      count += 1
    end
  end

  # position = position % 100
  # if position < 0
  #   position += 100
  # elsif position >= 100
  #   position -= 100
  # end


  printf "Ended at: %2d. Now count=%d\n", position, count
end

puts(count)
