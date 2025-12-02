position = 50
count = 0

for line in File.foreach('input.txt')
  which  = line[0]
  amount = line[1..].to_i()

  # if amount >= 100; abort("oops, amount is bad: #{amount}") end

  printf 'start: %2d, moving %s by %2d. ', position, which, amount

  if which == 'L';    position -= amount
  elsif which == 'R'; position += amount
  else                abort("oops, bad which: #{which}") end


  position = position % 100
  # if position < 0
  #   position += 100
  # elsif position >= 100
  #   position -= 100
  # end

  if position == 0
    count += 1
  end

  puts "Ended at: #{position}. Now count=#{count}"
end

puts(count)
