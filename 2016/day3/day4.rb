#!ruby -nrstringio
BEGIN{$stdin = StringIO.new <<'EOS'}
bbb-aaaaa-z-y-x-123[abxyz]
a-b-c-d-e-f-g-h-987[abcde]
not-a-real-room-404[oarel]
totally-real-room-200[decoy]
EOS


gsub /\[.*\]/, '\&\`'
gsub '-', ''
gsub /\G([^-])/, '[\1]'
p $_
exit
# gsub /.*\[/, 
print
# gsub /\G./, 

# bbb-aaaaa-z-y-x-123[abxyz]
