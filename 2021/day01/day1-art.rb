# Day 1: We needed to gauge depths in a submarine.
# Put input in a file named `day1.txt`

                open(
                ?d+
              'ay1.t'\
 'xt'        ).map{|x|
  x.to_i}.tap{|q|$l=q};p$l.
each_cons(2).count{|a,b|a<b};
p$l.each_cons(03).map(&:sum).
  each_cons(2).count{|a,b|a<
 b};    puts('2021: Day1!')
