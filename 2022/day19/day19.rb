require_relative '../submitter'
download! 2022, 19

$stdin = DATA
blueprints = []
$stdin.each do |line|
  blueprints.push line.scan(/\d+/).map(&:to_i)[1..]
end
p blueprints

__END__
Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 2 ore. Each obsidian robot costs 3 ore and 14 clay. Each geode robot costs 2 ore and 7 obsidian.
Blueprint 2: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 12 obsidian.
