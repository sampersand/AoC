open STDIN, 'day17.txt';

$;=$"=',';
while(<>){chomp,$x=0;++$x,'#'eq$_ and$S{$x,$.,0,0}=1 for split''}
$,="\n";
for$P(1,2){
	%C=%S;
	if($P==1){(@_=split$;),pop@_,$C{"@_"}=delete$C{$_}for keys%C;}

	for(0..5){
		%H=();
		for(keys%C){++$H{$_}for glob join$;,map{"{@{[$_-1..$_+1]}}"}split$;}
		%K=();
		($x=$H{$_})==3||$x==4&&$C{$_}and$K{$_}=1 for keys%H;
		%C=%K;
	}

	print "Part $P: $#{[1,keys %C]}\n";
}

=begin
                        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                      XXXXX                        XXXXX
                    XXX XXX                      XXX XXX
                  XXX   XXX                    XXX   XXX
                XXX     XXX                  XXX     XXX
              XXX       XXX                XXX       XXX
            XXX         XXX              XXX         XXX
          XXX           XXX            XXX           XXX
        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX             XXX
        XXX             XXX          XXX             XXX
        XXX             XXX          XXX             XXX
        XXX             XXX          XXX             XXX
        XXX             XXX          XXX             XXX
        XXX             XXX          XXX             XXX
        XXX             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        XXX           XXX            XXX           XXX
        XXX         XXX              XXX         XXX
        XXX       XXX                XXX       XXX
        XXX     XXX                  XXX     XXX
        XXX   XXX                    XXX   XXX  
        XXX XXX                      XXX XXX    
        XXXXX                        XXXXX
        XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
=cut
