# Day 3. I drank a coffee to stay awake for the challenge
$stdin = open 'day3.txt'

              (
          r  =
         ->  a,
         b    =
          0{
[?1,*'a'..'z',*'A'..'Z']
 .index a});t=(l=$<.map &\
 :chars).each_slice(03)   .
 sum{r[*_1.reduce(:&)]}   ;
   o=l.sum{n=_1.size   ./2
       r[*_1&_1.
slice!(...n)]};puts(t,o)
__END__
$stdin = open 'day3.txt'

l = $<.map(&:chars)
r = ->a,b=0{[?1,*?a..?z,*?A..?Z].index a}
t = l.each_slice(3).sum{r[*_1.reduce(:&)]}
o = l.sum{r[*_1&_1.slice!(..._1.size/2)]}


              #
          #  #
         ##  ##
         #    #
          #
########################
 #########################
 ######################   #
 ######################   #
   #################   ###
       #########
###########################
raise unless p([t,o]) ==[2633,7785]
