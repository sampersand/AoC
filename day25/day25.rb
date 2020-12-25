cardpub, doorpub = open('day25.txt').map(&:to_i)


(1..)
	.lazy
	.map { [_1, 7.pow(_1, 20201227)] }
	.find { _2 == cardpub || _2 == doorpub }
	.then { (_2 == cardpub ? doorpub : cardpub).pow _1, 20201227 }
	.display


	
