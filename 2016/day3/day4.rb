#!ruby -W0lnrstringio
BEGIN{$stdin = StringIO.new <<'EOS'}
aaaaa-bbb-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
EOS

$_ = 'zyx'
while /(.)(.)/ && $1 > $2
  sub $&, "#$2#$1"
end
print
exit
__END__
$_ = 'zyx'
while /(zy)|(yx)/# && $` < $'
  sub /(.)
  # sub "#$`#$&", "#$&#$`"
  print $'
  exit if ($x||=0; $x+=1)  >100
end
p $&
print
exit
# sub /-\d+/, ''
sub /(.*)\[(.*)\]/, '\2|\1'
gsub ?-,''
print
__END__

gsub /\[.*\]/, '\&\`'
gsub '-', ''
gsub /\G([^-])/, '[\1]'
p $_
exit
# gsub /.*\[/, 
print
# gsub /\G./, 

# bbb-aaaaa-z-y-x-123[abxyz]
