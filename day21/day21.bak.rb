all_allergens = {}
all_ingrediants = []

open('day21.txt')
	.each_line
	.map { _1.chomp =~ /\(contains/ and [$`.split, $'.tr(',', ' ')[..-2].split] }
	.each do |ings, algs|
		all_ingrediants += ings

		algs.each do |alg|
			all_allergens[alg] ||= ings
			all_allergens[alg] &= ings
		end
	end

allergins_list = all_allergens.map(&:flatten)
allergens = {}

until allergins_list.empty?
	alerg, ing = allergins_list.sort_by!(&:length).shift

	allergins_list.map! { _1 - [ing] } 
	allergens[alerg] = ing
end

p all_ingrediants.count { !allergens.values.include? _1 }
p allergens.sort_by(&:first).map(&:last).join(',')
