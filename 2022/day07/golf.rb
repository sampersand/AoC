# Day 7: We had to navigate folders on a computer
$stdin = open 'day7.txt'

# A=[];D=->s{$<.map{_1['..']&&break;s+=_1['d ']?D[0]:_1.to_i};A<< s;s};C=D[-4e7];p A.sum{_1<1e5?_1:0},A.select{C<_1}.min

A=[];D=->s{$<.map{_1['..']&&break;s+=_1['d ']?D[0]:_1.to_i};A<< s;s};C=D[-4e7];p A.sum{_1<1e5?_1:0},A.select{C<_1}.min


# D=->s{$<.map{_1['..']and break A<< s;s+=_1['d ']?D[0]:_1.to_i}[-1]};p (A=[0]).select{_1>$q||=D[-4e7]}.min,A.sum{_1<1e5?_1:0}
