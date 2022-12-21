require_relative '../submitter'

$stdin = open 'day21.txt'
monkeys = {}

$stdin.each_line do |line|
  name, value = line.split ':'

  monkeys[name] = Integer(value, exception: false) || 
    value.gsub(/\w+/, 'Integer(monkeys.fetch("\&"))')
end

def reduce!(monkeys)
  begin
    changed = false

    monkeys.transform_values! do |value|
      eval(value).tap { changed = true }
    rescue
      value
    end
  end while changed
end

part1 = monkeys.dup
puts "part 1: #{reduce!(part1)['root']}"

monkeys['root'].gsub!(/[-+*\/]/, '==')
monkeys.delete('humn')

def reduce_human(form)

begin
  changed = false

  monkeys.transform_values! do |value|
    next value if value.is_a? Integer
    value.gsub /Integer\(monkeys.fetch\("(.*?)"\)\)/ do
      case i = monkeys[$1]
      when Integer then i
      when nil then $&  # ie humn
      else changed = "(#{i})"
      end
    end
  end
end while changed

monkeys['jumn']

fail unless monkeys['root'].gsub(/\s/,'') == DATA.read.gsub(/\s/,'')
__END__
(27 * (940 + ((13085427083031 - ((((((((((((288 + (738 + (((2 * ((2 * (((((369 + (((952 + ((((((((956 + (102 * (852 + ((((((171 + (((((((((865 + (((2 * (((495 + (((3 * ((17 * (((Integer(monkeys.fetch("humn")) + 731
) / 2
) - 366
)
) + 135
)
) - 416
) + 126
)
) / 2
) + 945
)
) - 361
) / 3
)
) / 2
) - 721
) * 3
) - 438
) * 2
) + 525
) / 9
) + 872
)
) / 7
) - 285
) * 5
) - 613
) / 9
)
)
)
) / 2
) - 808
) * 3
) + 500
) * 2
) - 307
) / 3
)
) * 2
) - 243
)
) / 4
) + 291
) / 2
) - 257
)
) - 261
)
) + 522
) / 4
)
)
) / 7
) - 240
) * 38
) - 714
) / 5
) + 393
) * 2
) + 914
) * 2
) - 618
) / 11
)
) / 3
)
)
) == 40962717833337
