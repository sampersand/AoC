nums = Io.File("day1.txt").read()
	.split("\n")
	.select(Text::@bool)
	.map(Text::@num);

nums.enumerate((n, i) -> {
	nums.get(i, -1).enumerate((m, j) -> {
		if (n + m == 2020) {
			disp(n * m);
			quit();
		}
	})
})

# 0.upto(nums.len()).each(i -> {
# 	n = nums.get(i);
# 	i.upto(nums.len()).each(j -> {
# 		m = nums.get(j);
# 		if (n + m == 2020) {
# 			disp(n * m);
# 			quit();
# 		}
# 	})
# })
