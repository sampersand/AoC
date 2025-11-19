#!ruby -W0
$stdin = open 'input.txt'
# $stdin = DATA

def categorize(chars)
  rank = case p(chars.sort)
  in [a, ^a, ^a, ^a, ^a]   then 6 # six of a kind
  in [*, a, ^a, ^a, ^a, *] then 5 # five of a kind
  in [^a, ^a, b, ^b, ^b]   then 4 # full house v1
  in [ a, ^a, ^a, b, ^b]   then 4 # full house v2
  in [*, a, ^a, ^a, *]     then 3 # three of a kind
  in [a, ^a, _, b, ^b]     then 2 # two pair v1
  in [*, a, ^a, b, ^b, *]  then 2 # two pair v2
  in [*, a, ^a, *]         then 1 # pair
  else                          0 # nothing
  end
end

hands = $stdin.map do |line|
  bid = line[/\s\d+/].to_i
  hand = $`.chars.map!{'23456789TJQKA'.index _1}

  [hand, [categorize(hand), bid]]
end.to_h

s=->{_1.map{|l|'23456789TJQKA'[l]}.join}
p hands.sort { |(h1,(c1)),(h2,(c2))| (c1<=>c2).nonzero? or h1 <=> h2 }
  # .map{[_1[0].map{|x|'23456789TJQKA'[x]}.join, _1[1]]}
  .each_with_index
  .map{_1[1][1] * (_2+1)}.sum
  # .map{[_1,_2+1]}
  # .map { _1.last.last }
  # .each_with_index
  # .map { [_1, _2+1] }


__END__
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
