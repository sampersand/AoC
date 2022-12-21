def reduce!(monkeys)
  begin
    changed = false
    monkeys.each_value do |value|
      value.gsub! /\b[a-z]\w*\b/ do
        changed = "(#{monkeys[$&]})"
      end
    end
  end while changed
end

$stdin = open 'day21.txt'

monkeys = $stdin.map { _1.gsub(/\s/, '').split ':' }.to_h

part1 = monkeys.dup
reduce! part1
puts eval part1['root']

exit
monkeys['root'].gsub!(/[-+*\/]/, '==')
monkeys.delete 'humn'
monkeys['humn'] = 'humn'
reduce! monkeys

# eq = monkeys['root']
# p eq
# __END__
# loop do
#   eq.gsub!(/\((\d+)\)/, '\1') and next
#   eq.gsub!(/(\d+)([-+*\/])(\d+)/){ $1.to_i.send $2, $3.to_i } and next
#   eq.gsub!(/(?<g>\(())/
#   break
# end
# p eq
# p input['root'].gsub(/\s/, '')
fail unless eval monkeys['root'].gsub(/\s/, '').sub('humn', '3769668716709')
