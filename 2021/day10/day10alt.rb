$stdin=open('day10.txt')

# Day 10, part 1 with just regex lol
$stdin.map(&:chomp).sum{|line|
  %r{
    (?<re>
      (?>(?:
         \(\g<re>*(?:\)|(?<a>[^\)]).*|$)
        |\{\g<re>*(?:\}|(?<a>[^\}]).*|$)
        |\[\g<re>*(?:\]|(?<a>[^\]]).*|$)
        |\<\g<re>*(?:\>|(?<a>[^\>]).*|$)
    )*)
    )
  }x =~ line
  a ? {?)=>3,?]=>57,?}=>1197,?>=>25137}[a] : 0
}.display

