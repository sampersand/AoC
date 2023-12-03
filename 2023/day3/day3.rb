LINES = open('input.txt').read

gears = {}

LINES.each_line.with_index do |line, j|
  line.scan(/[^\s\d.]/) do
    # NOTE: `$~.begin(0)` is the beginning index of the regex match (
    # and `$~.end(0)` is one past the end of the match)
    gears[$~.begin(0) + j.i] = []
  end
end

p1 = []
LINES.each_line.with_index do |line, j|
  line.scan(/\d+/) do
    ($~.begin(0) - 1..$~.end(0)).each do |y|
      (j - 1..j + 1).each do |x|
        (gears[y + x.i] or next).push $&.to_i
        p1.push $&
      end
    end
  end
end

p p1.uniq(&:__id__).sum(&:to_i)
p gears.sum { |_key, ids| ids.length == 2 ? ids.reduce(:*) : 0 }

# h = {}
# inp = $stdin.map(&:chomp).map(&:chars)
# inp.each_with_index do |LINES, x|
#   a = ''
#   l.each_with_index do |k, y|
#     # p [l, x]
#   exit
# end
# p inp


__END__
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
