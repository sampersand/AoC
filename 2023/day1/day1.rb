require '../aoc/aoc'

aoc(2023, 1)
download!

testcase part: 1, input: <<EOS, answer: '142'
1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
EOS

testcase part: 2, input: <<EOS, answer: '281'
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
EOS

part1 do
  $stdin.sum { (_1[/\d/] + _1[/.*\K\d/]).to_i }
end

part2 do
  a={'one'=>1,'two'=>2,'three'=>3,'four'=>4,'five'=>5,'six'=>6,'seven'=>7,'eight'=>8,'nine'=>9,'zero'=>0}
  k=Regexp.union(/\d/, *a.keys)
  $stdin.sum {"#{_1[k]; a[$&]||$&}#{_1.rindex k; a[$&]||$&}".to_i }
end
