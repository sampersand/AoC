# Global leaderboard: 68 part1, 97 part2
# this is the exact, unadulterated code i used lol
data=open('day3.txt').map(&:chomp)
q=data.map(&:chars).transpose
a= data.map(&:chars).transpose.map { |x| x.count('0') > x.count('1') ? '0' : '1' }.join.to_i 2
b= data.map(&:chars).transpose.map { |x| x.count('0') > x.count('1') ? '1' : '0' }.join.to_i 2

p a * b
index = 0
data1=data.dup
while data.length != 1
  data.select! { |x|
    x[index] == (data.map(&:chars).transpose[index].count('0') > data.map(&:chars).transpose[index].count('1') ? ?0 : ?1)
  }
  index += 1
end
p data

index = 0
while data1.length != 1
  d = data1.dup
  data1.select! { |x|
    x[index] == (d.map(&:chars).transpose[index].count('0') <= d.map(&:chars).transpose[index].count('1') ? ?0 : ?1)
  }
  index += 1
end
p data1
p data[0].to_i(2) * data1[0].to_i(2)
