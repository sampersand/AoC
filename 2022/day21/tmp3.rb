def reduce!(monkeys)
  begin
    changed = false
    monkeys.each_value do |value|
      value.gsub! /[a-z]+/ do
        changed = "(#{monkeys[$&] or next $&})"
      end
    end
  end while changed
end

$stdin = open 'day21.txt'

monkeys = $stdin.map { _1.gsub(/\s/, '').split ':' }.to_h

humn = monkeys.delete('humn').to_i
part1 = monkeys.dup
reduce! part1
puts eval part1['root']

monkeys['root'].gsub!(/[-+*\/]/, '==')
reduce! monkeys
p monkeys

class Term
  def +(rhs) = Equation.new(self, -rhs, :+)
  def -(rhs) = Equation.new(self, rhs, :+)
  def *(rhs) = Equation.new(self, 1 / rhs.to_r, :*)
  def /(rhs) = Equation.new(self, rhs, :*)

  def coerce(r) = [self, LeftHandSideInt.new(r)]
end

class Human < Term
  def ==(rhs) = rhs
end

class Equation < Term
  def initialize(left, right, op)
    @left, @right, @op = left, right, op
  end

  def ==(rhs)
    @left == @right.public_send(@op, rhs)
  end
end

class LeftHandSideInt
  def initialize(value)
    @value = value
  end

  def to_r = @value.to_r # to rational number
  def -@ = -@value # ie unary negation
  def +(rhs) = @value - rhs
  def *(rhs) = @value / rhs
end

humn = Human.new
puts eval monkeys['root']
# fail unless p(eval(monkeys['root'])) == 3769668716709
