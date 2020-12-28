%all_allergens=();
@all_ings=();

while(<DATA>) {
	chomp;
	chop;
	m/\(contains/;

	@ings = split ' ', $`;
	@algs = split ' ', $' =~ y/,/ /r;

	push @all_ings, @ings;

	for(@algs) {

		$all_allergens{$_} //= [@ings];
		$all_allergens{$_} = [grep { 1 + index "@ings", $_ } @{$all_allergens{$_}}];
	}
}

%allergens = ();
@all_allergens = map { [$_, @{$all_allergens{$_}}]} keys %all_allergens;
print map { @$_ } values %all_allergens;
exit;
undef %all_allergens;

while (@all_allergens) {
	@all_allergens = sort { $#{@$a} <=> $#{@$b} } @all_allergens;
	($alerg, $ing) = @{shift @all_allergens};

	$allergens{$alerg} = $ing;
	# for (@all_allergens) {
	# 	delete
	# }

	exit;
	# allergins_list.map! { _1 - [ing] } 
	# allergens[alerg] = ing

}
# until all_allergens.empty?
#   all_allergens.sort! { _1.last.length <=> _2.last.length }
#   alerg, ings = all_allergens.shift
#   all_allergens.map! { [_1, _2 - ings] } 
#   allergens[alerg] = ings.shift
#   fail unless ings.empty?
# end

# p all_ings.reject { allergens.values.include? _1 }.length
# p allergens.sort_by(&:first).map(&:last).join(',')

# print keys %all_allergens;


# while ($all_allergens)
print "@{$all_allergens[0]}";

=begin
require 'set'
all_allergens = {}

all_ings = []
open('day21.txt')
# DATA
  .each_line
  .map { _1.chomp =~ /\(contains/ and [$`.split, $'.tr(',', ' ')[..-2].split] }
  .each do |ings, algs|
    all_ings += ings

    algs.each do |alg|
      all_allergens[alg] ||= ings
      all_allergens[alg] &= ings
    end
  end

all_allergens = all_allergens.to_a
allergens = {}
until all_allergens.empty?
  all_allergens.sort! { _1.last.length <=> _2.last.length }
  alerg, ings = all_allergens.shift
  all_allergens.map! { [_1, _2 - ings] } 
  allergens[alerg] = ings.shift
  fail unless ings.empty?
end

p all_ings.reject { allergens.values.include? _1 }.length
p allergens.sort_by(&:first).map(&:last).join(',')
__END__
mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
trh fvjkl sbzzf mxmxvkd (contains dairy)
sqjhc fvjkl (contains soy)
sqjhc mxmxvkd sbzzf (contains fish)
=cut
__END__
mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
trh fvjkl sbzzf mxmxvkd (contains dairy)
sqjhc fvjkl (contains soy)
sqjhc mxmxvkd sbzzf (contains fish)
