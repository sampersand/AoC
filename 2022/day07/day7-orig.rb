require_relative '../submitter'
require_relative '../shorthand'
using Aoc
require 'pathname'

data = download! 2022, 7, lines: true
dir = {}

pwd = ''
while line = data.shift
  case line
  when /\$ cd \.\./ then pwd = Pathname(pwd).parent.to_s
  when /\$ cd / then pwd = File.join pwd, $'
  when /\$ ls/ then
    while l = data.shift
      case l
      when /dir / then (dir[pwd] ||= {})[File.join(pwd,$')] = {}
      when /\d+ / then (dir[pwd] ||= {})[$'] = $&.to_i
      else
        data.unshift l
        break
      end
    end
  end
end

$dir = dir
def size(v)
  v.sum {
    _2.is_a?(Integer) ? _2 : size($dir[_1])
  } || 0
end

submit! dir.map { |k, v| size(v) }.select { _1 < 100000 }.sum
unused = 70000000 - size(dir['/'])
submit! dir.min_by { |k,v| (x=unused + size(dir[k])) >= 30000000 ? [x, k] : [Float::INFINITY, k] }[0]
  .then { size dir[_1]}, 2
