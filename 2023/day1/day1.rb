require '../submitter'
require '../shorthand'
using Aoc

lines = download! 2023, 1, lines: true
p lines
exit
$stdin = lines
# $stdin = open 'day1.txt'
a={'one'=>1,'two'=>2,'three'=>3,'four'=>4,'five'=>5,'six'=>6,'seven'=>7,'eight'=>8,'nine'=>9,'zero'=>0}
k=Regexp.union(/\d/, *a.keys)
p $stdin.sum {"#{_1[k]; a[$&]||$&}#{_1.rindex k; a[$&]||$&}".to_i }
