def reduce!(monkeys)
  begin
    changed = false
    monkeys.each_value do |value|
      value.gsub! /\b[a-z]+\b/ do
        changed = "(#{monkeys[$&] or next $&})"
      end
    end
  end while changed
end

$stdin = open 'day21.txt'

data = $stdin.read

data.sub!(/^root: (.*)/, "\\&\n_\\&").sub!(/^humn: (.*)$/, '')
humn = $1.to_i

data.gsub! $1, "(#$2)" while data.sub! /^(\w+): (.*)\n?$/, ''
p eval data[/@: (.*)/, 1]

__END__
$stdin.each do |line|
  line.tr(':', '*')
  # eval line
  p line
  exit
end

monkeys = $stdin.map { _1.gsub(/\s/, '').split ':' }.to_h

part1 = monkeys.dup
humn = part1.delete('humn').to_i
reduce! part1
p eval part1['root']
exit
