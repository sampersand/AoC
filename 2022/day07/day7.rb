$stdin = open 'day7.txt'

ALL_SIZES = []

def dir_size
  sum = 0

  $stdin.each do |line|
    break if line == "$ cd ..\n"

    sum += line.start_with?("$ cd") ? dir_size : line.to_i
  end

  ALL_SIZES.push sum
  sum
end

computer_size = dir_size
puts ALL_SIZES.select{|size| size < 1e5}.sum
puts ALL_SIZES.select{|size| computer_size - 4e7 <= size}.min
