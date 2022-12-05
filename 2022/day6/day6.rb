require_relative '../submitter'

download! 2018, 3

testcase! <<EOS, 4
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
EOS

run! do |data|
  board = []
  data.each_line do |d|
    d =~ /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/
    x = $2.to_i.then { _1..._1 + $4.to_i }
    y = $3.to_i.then { _1..._1 + $5.to_i }

    x.each do |n|
      xs = (board[n] ||= [])
      y.each do |y|
        if xs[y]
          xs[y] = 2
        else
          xs[y] = 1
        end
      end
    end
  end

  board.flatten.compact.count { _1 == 2 }
end
