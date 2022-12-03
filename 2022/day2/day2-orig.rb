require_relative '../submitter'
data = download! push: false

puts data.each_line.map(&:chomp).map {
  (_1['Y'] ? {'A'=>1,'B'=>2,'C'=>3}[_1[0]] +3: _1['X'] ? {'A'=>3,'B'=>1,'C'=>2}[_1[0]] : 6 + {'A'=>2,'B'=>3,'C'=>1}[_1[0]])
}.sum
puts data.each_line.map {
  (_1['Y'] ? 2 : _1['X'] ? 1 : 3) + (_1[{'Y'=>'A','X'=>'C','Z'=>'B'}[_1.chomp[-1]]] ? 6 : _1.chomp.gsub(' ','').tr('ABC','XYZ').chars.uniq.length == 1 ? 3 : 0)
}.sum
