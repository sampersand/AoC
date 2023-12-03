require 'json'

$stdin = DATA
$stdin = open 'input.txt'
L = $stdin.read

q = {}

L.each_line.each_with_index do |line, j|
  line.scan(/[^\s\d.]/){
    q[$~.begin(0).to_i + j.i] = 1
  }
end

f = 0
L.each_line.each_with_index do |line, j|
  line.scan(/\b\d+/) {
  catch :a do
    (j - 1 .. j +1).each do |x|
      ($~.begin(0) - 1..$~.end(0)).each do |y|
         if q[y + x.i]
          f += p $&.to_i
          throw :a
        end
      end
    end
  end
    # q[$~.begin(0) + j.i] = $&.to_i
  }
end

p f
# h = {}
# inp = $stdin.map(&:chomp).map(&:chars)
# inp.each_with_index do |l, x|
#   a = ''
#   l.each_with_index do |k, y|
#     # p [l, x]
#   exit
# end
# p inp

$stdin.each do |l|
end

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
