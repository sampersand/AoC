$stdin = open 'day9.txt'
b = Hash.new 0
r = [0i]*10

$<.map{|l|
  n = {?D=>-1i,?U=>1i,?L=>-1,?R=>1}[l[/./]]
  $'.to_i.times{
    r[0]+=n

    (r.size-1).times{|i|
      next unless 2 <= ((x=r[i])-y=r[i + 1]).magnitude
      r[i+1]+=(x.real<=>y.real)+(x.imag<=>y.imag).i
    }

    b[r[+1]]+=1
    b[r[-1]]+=1i
  }
}

p a=b.count{_2.real>0}
p b=b.count{_2.imag>0}
raise unless a == 6098
raise unless b == 2597
