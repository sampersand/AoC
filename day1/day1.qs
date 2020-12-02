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
