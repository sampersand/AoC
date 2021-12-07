$stdin = open('day7.txt') # omit if reading from stdin


;d=  gets
 .split(
  ?,).
 map                        &:to_i
  G=(0     ...d.max).map{|n|d.map{_1
   .-(n).abs}};A=G.map(&:sum).min;B=G
     .map{|g|g.sum{|ff|ff*ff.succ/2}}
        .min;puts"part1:#{A}";puts"pa
          rt  :#{B}".gsub(/\s+/,"");
       ?/

#a= G.map(&:sum).min
#b= G.map{|g|g.sum{|_1|_1*(_1+1)/2}}.min

raise unless A == 344535
raise unless B == 95581659


