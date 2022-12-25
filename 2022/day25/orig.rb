def snafu(x)
  x.tr('210=-','43201').to_i(5) - ('2'*x.length).to_i(5)
end
def invsnafu(x)
  p (x + ('2'*x.to_s(5).length.succ).to_i(5)).to_s(5).tr '43201','210=-'
end

$stdin = open 'day25.txt'
$stdin = DATA
def snafu(x) = x.chars.reverse.each_with_index.sum {
  {?2=>2,?1=>1,?0=>0,?-=>-1,?==>-2}[_1]*5**_2
}
2=--=0000-1-0-=1=0=2

# # def snafu(x) = x.chars.reverse.each_with_index.sum {
# #   {?2=>2,?1=>1,?0=>0,?-=>-1,?==>-2}[_1]*5**_2
# # }

sum = $stdin.each_line(chomp: 1).sum do |line|
  snafu line
end
p invsnafu sum
p sum
p snafu '02=--=0000-1-0-=1=0=2'
__END__
1=-0-2
12111
2=0=
21
2=01
111
20012
112
1=-1=
1-12
12
1=
122
