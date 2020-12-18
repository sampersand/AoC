open STDIN, 'day17.txt';


                        while(<>){$x=chomp;for(split''){
                      $x++,                        "#"eq
                    +$_ and                      $;= $"=
                  ","   ,$T                    {$x   ,$.
                ,0,     0}=                  1}}     for
              $P(       1,2                ){%       C=%
            T;;         if(              1==         $P)
         {%K=           ();            for           ((+
        %C)){@_=split$;;pop@_;$K{"@_"}=$             C{$
        _}}             ;%C          =%K}            for
        (00             ..5          ){%             H=(
        );;             for          (%C             ){$
        H{+             $_}          ++,             000
        for             (glob join$;,map{"{@{[$_-1..$_+1]
        }}"             }split             $;)
#       XXX             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#       XXX             XXX          XXX             XXX
                        }BEGIN{*S=\&CORE::split; sub S{split@_}}
#       XXX             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
#       XXX           XXX            XXX           XXX
#       XXX         XXX              XXX         XXX
#       XXX       XXX                XXX       XXX
#       XXX     XXX                  XXX     XXX
#       XXX   XXX                    XXX   XXX  
#       XXX XXX                      XXX XXX    
#       XXXXX                        XXXXX
#       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# $;=$"=',';while(<>){chomp,$x=0;++$x,'#'eq$_ and$S{$x,$.,0,0}=1 for split''}$,="\n";for$P(1,2){%C=%S;if($P==1){(@_=split$;),pop@_,$C{"@_"}=delete$C{$_}for keys%C;}for(0..5){%H=();for(keys%C){++$H{$_}for glob join$;,map{"{@{[$_-1..$_+1]}}"}split$;}%K=();($x=$H{$_})==3||$x==4&&$C{$_}and$K{$_}=1 for keys%H;%C=%K;}print"Part $P: $#{[1,keys %C]}\n"}




    %K=();
    ($x=$H{$_})==3||$x==4&&$C{$_}and$K{$_}=1 for%H;
    %C=%K;
  }

  print "Part $P: $#{[1,keys %C]}\n";
  die unless $#{[1,keys %C]} == ($P == 1 ? 263 : 1680);
}
