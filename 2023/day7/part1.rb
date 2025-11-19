#!ruby -W0
$stdin = open 'input.txt'


def categorize(chars)
  n=chars.length
  case p chars.tally.values.sort
    in
  # in {_: 5} then 6
  in a
  end
  exit
  case p(chars.sort)
  in [   a, ^a|12, ^a|12, ^a|12, ^a|12]   then 6 # 5 of a kind
  in [*, a, ^a|12, ^a|12, ^a|12,     *] then 5 # 4 of a kind
  in [a, ^a|12, b, ^b|12, ^b|12]   then 4 # full house v1
  in [a, ^a|12, ^a|12, b, ^b|12]   then 4 # full house v2
  in [*, a, ^a|12, ^a|12, *]     then 3 # three of a kind
  in [a, ^a|12, _, b, ^b|12]     then 2 # two pair v1
  in [*, a, ^a|12, b, ^b|12, *]  then 2 # two pair v2
  in [*, a, ^a|12, *]         then 1 # pair
  else                          0 # nothing
  end
end
p categorize [1, 1, 2]

__END__
hands = $stdin.map do |line|
  bid = line[/\s\d+/].to_i
  hand = $`.chars.map!{'23456789TQKAJ'.index _1}
  # next unless hand[0]==12
  # p [hand, categorize(hand)]
  # exit

  # cat = case hand.count 0
  #       when 5 then hand
  #       when 4 then hand
  #       when 3 then hand+hand[0]*3
  #       when 2 then hand+hand[0]*2
  #       end 
  # p hand
  # exit
  [hand, [categorize(hand), bid]]
end.to_h

p hands.sort { |(h1,(c1)),(h2,(c2))| (c1<=>c2).nonzero? or h1 <=> h2 }
  .each_with_index
  .sum{_1[1][1] * (_2+1)}

__END__
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
