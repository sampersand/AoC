$stdin = open('input.txt')
# $stdin = DATA

inp = Hash.new { _1[_2] = {}}
$k = []
seeds = $stdin.gets.chomp[/:\K.*/].split.map(&:to_i)
$stdin.gets
$stdin.each_line("\n\n") do |l|
  l =~ /(\w+)-to-(\w+)/ or fail
  src = $1
  dst = $2
  $k << dst
  l.lines[1..].each do |q|
    next if q == "\n"
    a, b, r = q.split.map(&:to_i)
    b = b..b+r
    a = a..a+r
    inp[src][b] = [dst, a]
  end
end
$inp = inp
def find_location(seed)
  cat = 'seed'
  i = $k.dup
  until i.empty?
    # p [cat, seed]
    a, s = $inp[cat].find { _2; _1.include? seed }
    p [seed, a, s]
    if s
      p q = seed - a.begin
      # p a.end - 1 - seed
      p seed = s[1].begin + q
      # exit
      # seed = 
    end
    p seed
    # p [seed, a, s]
    # # exit
    cat = i.shift
  end
  seed
end
p seeds.map { find_location _1 }.min
# p find_location 79

__END__
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
