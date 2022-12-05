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
                            P[t,x,
                            y,z]};
                            [o,t].
                            map{|x
                          |x.map{_1[
                      00]}*+""}));BEGIN{
                      T=->{_1.transpose}
        P=->{_1[_2].prepend *_1[_3].shift(_4)}}
