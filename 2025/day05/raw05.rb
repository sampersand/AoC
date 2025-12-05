$* << 'input.txt' if $*.empty?

ranges = $<.gets("")
  .lines(chomp: true)
  .map { _1 =~ /-/; $`.to_i..$'.to_i}
  .tap(&:pop)

fresh = $<.count { ranges.include? it.to_i }
p fresh

new = nil
loop do
  old = ranges.length
  new = []
  ranges.each do |range|
    new.each_with_index do |newr, index|
      if newr.overlap? range or range.overlap? newr
        p [:yes, range, newr]
        new[index] = Range.new *[range.begin, newr.begin, range.end, newr.end].minmax
        break nil
      end
    end and new << range
  end
  p [new, ranges]
  break if new.length == ranges.length
  ranges = new
end
p new.sum(&:count)
