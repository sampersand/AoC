$stdin = open 'day7.txt'

F=[]
D=->{s=0;$<.map{_1=="$ cd ..\n"&&break;s+=_1[/\$ c/]?D[]:_1.to_i};F<< s;s}
C=D[]
p [F.select{_1<1e5}.sum,F.select{C-4e7<=_1}.min]


__END__



#########
#######################
#######################
#######################
#######################
#######################
#######################



146x30 for the upper part, then it fully declines by  181
entire thing is 400 long, 250 tall without it
