# checks if first arg is divisible by any other arg. If it is,
# returns the result of the division
divisible_by () {
	integer arg num=$1
	shift
	for arg do
		if (( (num / arg) * arg == num )) {
			: $(( num / arg ))
			true; return
		}
	done
	false; return
}
functions -M divisible_by 2 -1
