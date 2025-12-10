$* << 'sample.txt' if $*.empty?


data = $<.map { it.chomp.split(',').map(&:to_i) }
def dist(key, key2) = key.zip(key2).sum { (_1 - _2) ** 2 } ** 0.5

def two_closest(data, connected)
  closest = nil

  data.each do |key|
    data.each do |key2|
      next if key == key2
      next if connected[key]&.include? key2 or connected[key2]&.include? key
      d = dist key, key2

      if closest.nil? || d < closest[-1]
        closest = [key, key2, d]
      end
    end
  end

  closest
end

connected = {}#Hash.new { _1[_2] = [] }
loop do
  closest = two_closest(data, connected)
  break if closest.nil?
  x, y, _ = two_closest(data, connected)
  (connected[x]||=[]) << y
  x, y, _ = two_closest(data, connected)
end
p connected
p [x, y]
