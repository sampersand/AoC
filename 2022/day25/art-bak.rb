$stdin = open 'day25.txt'

i=->{_1.to_i 5}
s=->{_1.to_s 5}
T=->{i[?2*_1.size]}
a='0-2-=';b='23410';S=->{i[_1.tr a,b]-T[_1]}
I=->{s[_1+T[s[_1]]].tr b,a}
q=I[$<.sum{S[_1.chomp]}]

fail unless q == '2=--=0000-1-0-=1=0=2'

__END__

     ###########
  #################
#####################
#####################
#####################
 ###################
  #################
   ###############
     ###########
       #######
          # 
         ###
         ###
