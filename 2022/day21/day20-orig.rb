require_relative '../submitter'

$stdin = open 'day21.txt'
# $stdin = DATA
input = {}

$stdin.each_line do |line|
  line =~ /: /
  input[$`] = $'.gsub(/[a-zA-Z_]+/, 'Integer(input.fetch("\&"))')
end

until (Integer(input['root']) rescue false)
  input.transform_values! do |value|
    eval value
  rescue
    value
  end
  p input['root']
end
p input['root']

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
