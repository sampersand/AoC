#include <stdio.h>

int cmp(int *l, int *r) {
	return *r - *l;
}

int main() {
	int elves[1000], len; // big enough, yolo.
	char buf[1000000], *ptr = buf; // also big enough lol.
	fread(&buf, sizeof(buf), 1, fopen("input.txt", "r"));

	for (len = 0; *ptr; ++len) {
		elves[len] = 0;

		for (int tmp, amnt; *ptr && sscanf(ptr, "%d%n", &tmp, &amnt);) {
			elves[len] += tmp;
			ptr += amnt + 1;
			if (*ptr == '\n')
				break;
		}
	}

	qsort(elves, len, sizeof(int), cmp);

	printf("part 1: %d\npart 2: %d\n", elves[0], elves[0] + elves[1] + elves[2]);
}
