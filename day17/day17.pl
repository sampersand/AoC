open STDIN, 'day17.txt';

$;=',';
while(<>){chomp,$x=0;$S{$x++,$.,0,0}=1 for split''}

$x=0;$y=1;
$"=',';
$,="\n";
# for (glob "{@{[$x-1..$x+1]}},{@{[$y-1..$y+1]}}"){
# 	print "<$_>";

# }

$"=',';
for$P(0,1){
	%C=%S;
	for(0..6){
		%H=();
		for(keys%C){
			($x,$y,$z,$w)=split$;;
			for(glob "{@{[$x-1..$x+1]}},{@{[$y-1..$y+1]}},{@{[$z-1..$z+1]}},{@{[$w-1..$w+1]}}") {
				++$H{$_}if !$P||$W
			}
		}
		%K=();
		for(keys %H) {
			# print $_, $H{$_};
			# exit;
			if($H{$_} == 3 || $C{$_} && $H{$_ } == 4) {
				$K{$_} =1 ;
			}
		}
		# print keys %K;
		%C=%K;
	}

	# print keys %C;
	# exit;
	print "Part $P: $#{[keys %C]}\n";
}
# 		cube.each do |x, y, z, w|
# 			[*x-1..x+1].product [*y-1..y+1], [*z-1..z+1], [*w-1..w+1] do |x2, y2, z2, w2|
# 				next if part.zero? && !w2.zero?
# 				hash[[x2, y2, z2, w2]] += 1
# 			end
# 		end

# 		cube = hash.filter_map { |k, v| v == 3 || cube.include?(k) && v == 4 and k }.to_set
# 	end

# 	puts "Part #{part}: #{cube.length}"
# end
