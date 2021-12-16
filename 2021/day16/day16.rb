# Global leaderboard 43/28
class String
  def bin = to_i(2)
  def take(n) = slice!(...n)
end

def decode(packet)
  ver = packet.take(3).bin
  type = packet.take(3).bin

  if type == 4
    acc = ''

    while (tmp = packet.take(5)).take(1) == '1'
      acc.concat tmp
    end

    return $part2 ? (acc + tmp).bin : ver
  end

  sub = [] 
  if packet.take(1) == '0'
    packet = packet.take packet.take(15).bin
    sub.push decode packet until packet.empty?
  else
    packet.take(11).bin.times do
      sub.push decode packet
    end
  end

  return ver + sub.sum unless $part2

  case type
  when 0 then sub.sum
  when 1 then sub.reduce(&:*)
  when 2 then sub.min
  when 3 then sub.max
  when 5 then sub[0]  > sub[1] ? 1 : 0
  when 6 then sub[0]  < sub[1] ? 1 : 0
  when 7 then sub[0] == sub[1] ? 1 : 0
  end
end

$stdin=open('day16.txt')
input = (x=gets).chars.map { "%04b" % _1.hex }.join
p x.chomp.to_i(16).to_s(16) == x
# p input.to_i(2)
# p p(input.to_i(16)) == x.chomp
puts decode input.dup
$part2 = true
puts decode input
