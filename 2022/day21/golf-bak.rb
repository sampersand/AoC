$stdin = open 'day21.txt'

L=$<.read.tr(?:,?=)
.sub(/root=.*/){"@#$&\n@_#{$&.sub(/ \S /,'==')}"}.sub(/humn=/, '')
humn=$'.to_i
L.gsub!$1,"(#$2)"while L.sub! /^(\w+)=(.*)/,''
eval L;p@root

humn=(C=Class).new(
T=Struct.new(:l,:r,:o){
  class C;alias d define_method end
  d(:n){T.new self,_2,_1}
  d(:-){n:+,_1}
  d(:+){n:+,-_1}
  d(:*){n:*,1r/_1.to_r}
  d(:/){n:*,_1}
  d(:coerce){|v|[self,C.new{d(:to_r){v};d(:-@){-v};d(:+){v-_1};d(:*){v/_1}}.new]}
  d(:==){l.==r.send o,_1}
}){d(:==){_1}}.new
eval L;p@_root.to_i

# fail unless 158731561459602 == (p@root)
# fail unless 3769668716709==p(@_root)
