sub play {
  @p1=@{$_[0]}
}
=begin
require 'set'

def play(p1, p2)
  until p1.empty? || p2.empty?
    c1, c2 = p1.shift, p2.shift

    if (x = yield c1, c2).nil? ? c2 < c1 : x
      p1.append c1, c2
    else
      p2.append c2, c1
    end
  end

  $ans = p1.reverse.unshift(0).each_with_index.map(&:*).sum
end

def recur(p1,p2)
  memo = Set.new

  play p1,p2 do |c1, c2|
    memo.add? [p1,p2].hash or return true
    if c1 <= p1.length && c2 <= p2.length
      recur p1.first(c1), p2.first(c2)
    end
  end

  p2.empty?
end

P1, P2 = open('day22.txt')
  .each_line("\n\n")
  .map(&:chomp)
  .map(&:lines)
  .map { _1.drop(1).map(&:to_i) }

p play(P1.dup, P2.dup) {}
recur P1, P2
p $ans

=cut
__END__
Player 1:
9
2
6
3
1

Player 2:
5
8
4
7
10
