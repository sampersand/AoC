# require_relative '../submitter'
# download! 2022, 23

$stdin = open 'day23.txt'
$stdin = DATA

elves = $stdin.each_with_index
  .flat_map { |l,i| l.each_char.with_index.filter_map { _1=='#' && i+_2.i } }
DIRS = []

p elves

__END__
.....
..##.
..#..
.....
..##.
.....
