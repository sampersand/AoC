require_relative '../submitter'

$stdin = open './day10.txt'

x=c=1
l=''
$stdin.flat_map{_1[/x/]?[?0,$']:[_1]}.map{
  l+=(x-1..x+1)===l.size ? ?#:?.
  1==(c+=1)%40&&(puts l;l='')
  /\d/=~_1&&x+=_1.to_i
}
