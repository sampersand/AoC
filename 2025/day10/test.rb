require 'z3'

A,B,C,D,E,F,G = ('a'..'g').map{ Z3.Int it }

solver = Z3::Solver.new
solver.assert A>=0
solver.assert B>=0
solver.assert C>=0
solver.assert D>=0
solver.assert E>=0
solver.assert F>=0
solver.assert G>=0
solver.assert(A + B + C + E + F == 17)
solver.assert(A      + E+ F+ G == 19)
solver.assert(        D+ E  + G == 27)
solver.assert( A+ B  + D  + F+ G == 35)
solver.assert(    B+ C+ D  + F+ G == 35)

# p solver.met
p solver.satisfiable?
p solver.model.enum_for(:each).sum{ _2.to_i }
p solver.class.instance_methods false
__END__
puts "Checking if (a+b)(a-b)==a*a-b*b"
solver
exit
__END__
solver.prove!(
    + a+ b+ c  + e+ f   == 17 and
  + a      + e+ f+ g == 19 and
        + d+ e  + g == 27 and
  + a+ b  + d  + f+ g == 35 and
    + b+ c+ d  + f+ g == 35

  (a+b)*(a-b) == (a*a - b*b)
)

__END__

csp = CSP::Solver::Problem.new
csp.vars :A..:G, 0..20

csp.constrain *:A..:G do |a,b,c,d,e,f,g|
  + a+ b+ c  + e+ f   == 17 and
  + a      + e+ f+ g == 19 and
        + d+ e  + g == 27 and
  + a+ b  + d  + f+ g == 35 and
    + b+ c+ d  + f+ g == 35
  # A*[0,1,_,3,_]
  # B*[0,_,_,3,4]
  # C*[0,_,_,_,4]
  # D*[_,_,2,3,4]
  # E*[0,1,2,_,_]
  # F*[0,1,_,3,4]
  # G*[_,1,2,3,4]

# (17,19,27,35,35)
end
p csp.solve
