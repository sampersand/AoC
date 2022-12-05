$stdin = open 'day5.txt'

      t=(o=$<.gets($/*2).lines[..-3].tap{
    R=  /(  \d  +)  \s  fr  om  \s  ?(  \d
  )\sto/x}.map{_1.scan(/.(.)../m).flatten};
     o   =                 T[   o]  .map{|
     x   |                x.grep_v  %#\s#}
     )   .                  map{_1       
     .dup}                  ;p(($<
       .                    map{R.
   =~_1;o[x=                ~0+$'.    
   to_i]+=o[                y=+$2.    
   to_i-+1].                shift\
                            z="#$1
                            ".to_i
                            P[t[x\
                            ],t[y].
                            shift(
                            z)]};[
                            o.map{     
                         _1[0]}*'',t.  
                       map{_1[0]}*'']))
BEGIN{T=->{_1.transpose};P=->{_1.prepend *_2}}
# $<.map{
#   /(\d+) from (\d) to (\d)/=~_1
# }

# p o.map{_1[0]}*''
# p t.map{_1[0]}*''

__END__

    ###################################
  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##
#########################################
