def twos(x) = ('2' * x.size).to_i(5)

def snafu(x)
  x.tr('210=-','43201').to_i(5) - twos(x)
end

def inv_snafu(num)
  (num + twos(num.digits(5))).to_s(5).tr('43201','210=-')
end


$stdin = open 'day25.txt'

puts inv_snafu $stdin.sum { snafu _1.chomp }
