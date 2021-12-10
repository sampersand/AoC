# Day 7: We had to avoid a whale by followign crabmarines
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
