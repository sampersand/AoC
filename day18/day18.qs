Number.'/' = Number::'+';
Number.'-' = Number::'*';

lines = Io::File('day18.txt').read().gsub('*','-').split("\n");

print("Part 1: ", lines.map(~$eval).sum());
print("Part 2: ", lines.map(line -> { line.gsub('+', '/') }).map(~$eval).sum());
