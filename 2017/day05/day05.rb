#!/usr/bin/env ruby
INPUT = File.readlines('input.txt').map(&:to_i)

ip = steps = 0
input = INPUT.dup
while (0...input.length).include? ip
  ip += (input[ip] += 1) - 1
  steps += 1
end
puts "part1: #{steps}"

ip = steps = 0
input = INPUT
while (0...input.length).include? ip
  input[ip] += ((x = input[ip]) >= 3 ? -1 : 1)
  ip += x
  steps += 1
end
puts "part2: #{steps}"
