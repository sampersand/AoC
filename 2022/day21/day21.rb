def reduce!(monkeys)
  begin
    changed = false
    monkeys.each_value do |value|
      value.gsub! /\b(?!humn)[a-z]\w*\b/ do
        changed = "(#{monkeys[$&]})"
      end
    end
  end while changed
end

$stdin = open 'day21.txt'


monkeys = $stdin.map { _1.gsub(/\s/, '').split ':' }.to_h

# part1 = monkeys.dup
# reduce! part1
# puts eval part1['root']

monkeys['root'].gsub!(/[-+*\/]/, '==')
monkeys.delete 'humn'
reduce! monkeys

class Term
  def +(r) = Eq.new(self, -(r.v rescue r), :+)
  def -(r) = Eq.new(self,  r, :+)
  def *(r) = Eq.new(self, 1r/(r.v rescue r), :*)
  def /(r) = Eq.new(self, r, :*)

  def coerce(r) = [self, Int.new(r)]
  def ==(r) = @l == @r.public_send(@o, r)
end

humn = Class.new(Term) { def ==(r) = r }.new
Eq = Class.new(Term){ def initialize(l,r,o) = (@l,@r,@o=l,r,o) }

Int = Struct.new(:v){
  def +(r)=v-r
  def *(r)=v/r
}

fail unless p(eval(monkeys['root'])) == 3769668716709
