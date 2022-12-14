require 'pathname'

$stdin = open 'day7.txt'

FILES = {}
pwd = Pathname('')

while line = gets(chomp: true)
  case line
  when /\$ cd (.*)/ then pwd /= $1
  when /\$ ls/
    folder = FILES[pwd] ||= {}

    while line = gets(chomp: true)
      case line
      when /^dir/ then folder[pwd / $'.strip] = {}
      when /^\d+/ then folder[pwd / $'.strip] = $&.to_i
      else break
      end
    end

    redo if line # since the line is a command
  else
    warn "unknown command: #{line.inspect}"
  end
end

def size(name)
  FILES[name].sum { _2.is_a?(Integer) ? _2 : size(_1) }
end

p FILES.map { |k, v| size(k) }.select { _1 < 100000 }.sum
unused = 70000000 - size(Pathname('/'))
p FILES.min_by { |k,v| (x=unused + size(k)) >= 30000000 ? [x, k] : [Float::INFINITY, k] }[0]
  .then { size _1}, 2
