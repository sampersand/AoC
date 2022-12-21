require_relative '../submitter'

download! 2022, 21
$stdin = open 'day21.txt'
# $stdin = DATA
input = {}

$stdin.each_line do |line|
  line =~ /: /
  input[$`] = $'.gsub(/[a-zA-Z_]+/, 'Integer(input.fetch("\&"))')
end
input['root'].gsub! /[+\/]/, '=='
input.delete 'humn'

x = 100.times.map do |n|
  fork do
    inp = input
    (n * 100).upto((n + 1) * 100) do |n|
      input = inp.dup

      input['humn'] = n
      $x = 0
      until (Integer(input['root']) rescue false)
        break if ($x += 1) > 100
        input.transform_values! do |value|
          eval value
        rescue
          value
        end
      end
      if input['root']
        submit! input['humn'], 2
        p "yep!" + input['humn'].to_s
      else
        p 'oops: ' + n.to_s
      end
    end
    # p input['root']
  end
end
x.each(&:join)

__END__
root: pppw + sjmn
dbpl: 5
cczh: sllz + lgvd
zczc: 2
ptdq: humn - dvpt
dvpt: 3
lfqf: 4
humn: 5
ljgn: 2
sjmn: drzm * dbpl
sllz: 4
pppw: cczh / lfqf
lgvd: ljgn * ptdq
drzm: hmdt - zczc
hmdt: 32
