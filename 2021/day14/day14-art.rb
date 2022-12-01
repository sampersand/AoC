$stdin = open('day14.txt')

  
CFFPOHBCVVNPHCNBKVNV
  ########        ########        ########        ########    
 ##      ##      ##      ##      ##      ##      ##      ##   
##        ##    ##        ##    ##        ##    ##        ##  
 ##      ##      ##      ##      ##      ##      ##      ##   
  ########        ########        ########        ########    
     ##      ##      ##      ##      ##      ##      ##       
       ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ## 
         ##      ##      ##      ##      ##      ##      ##   

S=gets.chop.chars
gets;X=$<.map{_1.chomp.split' -> '}.to_h

R=->a{
  g=S.each_cons(2).map{_1*''}.tally
  a.times{
    n=Hash.new 0
    g.map{|g,c|(x=X[g])?(n[g[0]+x]+=c;n[x+g[1]]+=c):n[g]+=c};g=n
  }
  c=Hash.new 0
  g.map{c[_1[0]]+=_2;c[_1[1]]+=_2}
  c[S[0]]+=1;c[S[-1]]+=1
  a,b=c.map{_2/2}.minmax;b-a
}

raise unless 2947 == p(R[10])
raise unless 3232426226464 == p(R[40])
