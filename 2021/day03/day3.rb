class Array
  # older versions of ruby dont have this method.
  defined? tally or def tally; each_with_object(Hash.new 0){|k,h|h[k]+=1} end
end

data = open('day3.txt').map { _1.chomp.chars }
part1 = data
  .transpose
  .map { _1.sort[_1.length/2] }
  .join

# not '* ~n.to_i(2)' bc infinite precision
puts "part1: #{part1.to_i(2) * part1.tr('01','10').to_i(2)}"

def reduce!(ary, index, method)
  select = ary
    .transpose[index]
    .tally
    .values_at('0', '1')
    .reduce(&method) ? '0' : '1'

  ary.select! { _1[index] == select }
end

data1=data.dup
data.first.size.times do |index|
  reduce!(data, index, :>) unless data.one?
  reduce!(data1, index, :<=) unless data1.one?
end

puts "part2: #{data[0].join.to_i(2) * data1[0].join.to_i(2)}"
