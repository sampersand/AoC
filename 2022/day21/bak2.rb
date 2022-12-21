require 'bigdecimal'
require 'bigdecimal/util'

def reduce!(monkeys)
  begin
    changed = false
    monkeys.transform_values! do |value|
      next value if value.is_a? Integer
      value.gsub /\w+/ do
        case i = monkeys[$&]
        when Integer then "(#{i})"
        when nil then $&
        else changed = "(#{i})"
        end
      end
    end
  end while changed
end

$stdin = open 'day21.txt'
# $stdin = DATA

monkeys = $stdin.map { _1.gsub(/\s/, '').split ':' }.to_h

part1 = monkeys.dup
reduce! part1
puts eval part1['root']

monkeys['root'].gsub!(/[-+*\/]/, '==')
monkeys.delete 'humn'
reduce! monkeys

eq = monkeys['root']

loop do
  eq.gsub!(/\((\d+)\)/, '\1') and next
  eq.gsub!(/(\d+)([-+*\/])(\d+)/){ $1.to_i.send $2, $3.to_i } and next
  break
end

Eq = Struct.new :lhs, :rhs, :op do
  def +(rhs) = Eq.new(self, BigDecimal(rhs), :-)
  def -(rhs) = Eq.new(self, BigDecimal(-rhs), :+)
  def *(rhs) = Eq.new(self,BigDecimal(rhs), :/)
  def /(rhs) = Eq.new(self,(1r/rhs.to_r).to_d(100), :*)
  # def ==(rhs) = invert(rhs)
  def coerce(rhs) = [self, BigDecimal(rhs)]
  def ==(onto) 
    # [66220055451880, :/, 17, 3895297379522]
    #   66220055451874
    lhs == onto.send(op, rhs)
  end
end

p 4 / Eq.new(3)
exit

# -0.3769668727897149444545620105627390274995061591695472664361082352942e13
#   3769668716709
# eq = <<EOS.gsub(/\s/,'')
# 13085427083031-((((((((((((288+(738+(((2*((2*(((((369+(((952+((((((((956+(102*(852+((((((171+(((((((((865+(((2*(((495+(((3*((17*(((humn+731)/2)-366))+135))-416)+126))/2)+945))-361)/3))/2)-721)*3)-438)*2)+525)/9)+872))/7)-285)*5)-613)/9))))/2)-808)*3)+500)*2)-307)/3))*2)-243))/4)+291)/2)-257))-261))+522)/4)))/7)-240)*38)-714)/5)+393)*2)+914)*2)-618)/11)
# ==
# ((40962717833337/27)-940)*3
# EOS
eq = '(2/(1 - humn))/4 == 40'
humn = Class.new(Eq){ def ==(onto) = $x=onto }.new
eval eq
p $x
puts "%d" % $x

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
