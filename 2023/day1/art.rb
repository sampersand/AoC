# Day 1, part 2: We were loaded into a trebuchet
$stdin = open 'day1.txt' # Omit if reading from stdin

                                       a,k=$<
                                   .sum{  |
                               l|"#{     l[k
                           ];a[$&        ]or
                      $&}#{l.
                  rindex(
            k);a[$&]or
        $&}"&.   to_i}\
    if(a=        eval'
      {          "one"
   =>1,"tw       o"=>2
   ,"three       "=>3,
              "f our"= >4
            ,"   five"   =>
          5,     "six"     =>
    6,"seven"=>7,"eight"=>8,"nine"
   =>9,"zero"=>0}'.tr("\s\n",'');k=
   Regexp.union /\d/,*a.keys);p(+a)
