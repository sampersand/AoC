open STDIN, 'day7.txt';

sub doit {
  while (<>) {
    chomp;
    print;

    /^cd \.\./ and break;
    /^cd/ and 
  }
}
__END__
#!ruby -rpathname -n
BEGIN {
  $stdin = open 'day7.txt'
  fs = Hash.new { _1[_2] = {} }
  pwd = Pathname('')
}
END{

$fs=fs
def size(name)
  $fs[name].sum { _2.is_a?(Integer) ? _2 : size(_1) }
end

p fs.map { |k, v| size(k) }.select { _1 < 100000 }.sum
unused = 70000000 - size(Pathname('/'))
p fs.min_by { |k,v| (x=unused + size(k)) >= 30000000 ? [x, k] : [Float::INFINITY, k] }[0]
  .then { size _1}, 2
}

chomp

if /^dir /
  fs[pwd][pwd / $'.strip] = {}
elsif /^\d+/
  fs[pwd][pwd / $'.strip] = $&.to_i
end

if /\$ cd /
  pwd /= $'
  next
end

__END__
  if /\$ cd (.*)/
    pwd /= $1
    next
  end

  next unless /\$ ls/ # ignore invalid stuff
  folder = fs[pwd] ||= {}

  while gets(chomp: true)
    if /^dir /
      folder[pwd / $'.strip] = {}
    elsif /^\d+/
      folder[pwd / $'.strip] = $&.to_i
    else
      break
    end
  end

  redo if $_ # since the line is a command
else
  warn "unknown command: #{line.inspect}"
end
end

def size(name)
  fs[name].sum { _2.is_a?(Integer) ? _2 : size(_1) }
end

p fs.map { |k, v| size(k) }.select { _1 < 100000 }.sum
unused = 70000000 - size(Pathname('/'))
p fs.min_by { |k,v| (x=unused + size(k)) >= 30000000 ? [x, k] : [Float::INFINITY, k] }[0]
  .then { size _1}, 2
