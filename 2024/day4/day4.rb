#!/usr/bin/env r49

# This is written in Ruby 0.49: github.com/sampersand/ruby-0.49

# I never actually finished this, because i dont have a fun way to do it.

if $ARGV.length == 0 then
  $ARGV = ['./sample.txt']
end

lines = []
$; = ''
while gets()
  /\n/ && $_.chop
  lines << $_.split
end

# count left-right
found = 0
for line in lines
  do 0.upto(line.length) using i
    if line[i] == 'X' && line[i+1] == 'M' && line[i+2] == 'A' && line[i+3] == 'S'
      found += 1
    end

    if line[i] == 'X' && line[i-1] == 'M' && line[i-2] == 'A' && line[i-3] == 'S'
      found += 1
    end
  end
end

# top-bottom
for line in lines
  do 0.upto(line.length) using i
    if line[i] == 'X' && line[i+1] == 'M' && line[i+2] == 'A' && line[i+3] == 'S'
      found += 1
    end

    if line[i] == 'X' && line[i-1] == 'M' && line[i-2] == 'A' && line[i-3] == 'S'
      found += 1
    end
  end
end
print(found)

print(lines._inspect)

# print($ARGV)
# if (( !$# )) set ${0:h}/sample.txt

# p $(cat $1 | sed 's/./ &/g')
