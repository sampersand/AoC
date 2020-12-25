# pk1 = 5764801
# ls1 = 8
# pk2 = 17807724
# ls2 = 11

pk1 = 15733400
pk2 = 6408062

ls1 = 3903333
ls2 = 10459425

v = 1
subj = pk1
ls2.times do 
		v *= subj
		v %= 20201227
end
p v
v = 1
subj = pk2
ls1.times do 
		v *= subj
		v %= 20201227
end
p v
=begin calculator
v = 1
subj = 1
(1..).each do |i|
	v = (v * subj) % 20201227

	if v == pk1
		puts "pk1: #{i}"
		pk1 = nil
		exit unless pk2
	elsif v == pk2
		puts "pk2: #{i}"
		pk2 = nil
		exit unless pk1
	end
	# p i if i % 10_000 == 0
end
=end calculator


__END__
cpk = 5764801
sn = 7
v = 1
ls = 8
ls.times do 
	v *= sn
end

v = sn ** ls

p v  % 20201227

require 'prime'
p 20201226.prime?
