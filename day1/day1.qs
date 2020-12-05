nums = Io.File("day1.txt")
	.lines()
	.reject(Text::empty?)
	.map(Text::@num);

nums.enumerate((x, i) -> {
	nums[i, -1].each(y -> {
		(x + y == 2020).then(quit << 0 << x * y)
	})
})

