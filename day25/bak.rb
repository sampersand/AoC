cardpub, doorpub = open('day25.txt').map(&:to_i)

v = 1
(1..).each do |i|
	v = (v * 7) % 20201227

	if (c = v == cardpub) || v == doorpub
		puts (c ? doorpub : cardpub).pow i, 20201227
		exit
	end
end
