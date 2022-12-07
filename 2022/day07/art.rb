# Day 7: We had to navigate folders on a computer
$stdin = open 'day7.txt'

A=[];D=proc\
{s=0;$<.map{_1['..']&&\
break;s+=_1["$ c"]?D[]:
+_1.to_i};s.tap{A<<+_1}
};C=D[];p([A.select{_1<
1e5}.sum,A.select{C-("|
\s";4e7)<=_1}.min]);/#/
