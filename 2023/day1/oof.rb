$stdin = open 'day1.txt'
a={'one'=>1,'two'=>2,'three'=>3,'four'=>4,'five'=>5,'six'=>6,'seven'=>7,'eight'=>8,'nine'=>9,'zero'=>0}
p $stdin.map{
  q=_1.dup
  nil while q.gsub!(/#{a.keys.join('|')}./, a)
  _1.reverse!
  nil while _1.gsub!(/#{a.keys.map(&:reverse).join('|')}/, a.transform_keys(&:reverse))
  p q+_1.reverse
  # (p [_1, _1.gsub(/#{a.keys.join('|')}/, a.transform_values{|q|"[#{q}]"}.to_h)])[1]
}.map{ (_1[/\d/] + _1.reverse[/\d/]).to_i }.sum
