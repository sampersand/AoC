position = 50
count = 0

File.foreach('sample.txt') do |line|
  which  = line[0]
  amount = line[1..].to_i()
  fail "amount is 0" if amount.zero?
  old_count = count
  printf 'start: %2d, moving %s by %2d. ', position, which, amount

  was_originally_zero = (position == 0)
  case which
  when 'L' then position -= amount
  when 'R' then position += amount
  when 'Q' then exit
  else abort "bad which: #{which}"
  end

  printf "[%3d] ", position

  n, result = position.divmod 100
  position = result
  printf "(%2d) ", n
  n += 1 if was_originally_zero && n.negative?
  n = n.abs
  count += n
  count += 0.1 if result == 0 && n == 0
  # next
  # # case position
  # # when 0
  # #   count += 1
  # # when

  # if position == 0
  #   count += 1
  # elsif position < 0
  #   if was_originally_zero
  #     count -= 1
  #   end

  #   while position < 0
  #     position += 100
  #     count += 1
  #   end
  # elsif position >= 100
  #   while position >= 100
  #     position -= 100
  #     count += 1
  #   end
  # end

  # position = position % 100
  # if position < 0
  #   position += 100
  # elsif position >= 100
  #   position -= 100
  # end


  printf "Ended at: %2d. Now count=%s (%.1f)\n", position, count, count - old_count
end

puts(count)
