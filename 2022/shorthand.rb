module Aoc
  refine Object do
    def s = to_s
    def i(...) = to_i(...)
  end

  refine Integer do
    def hex(fmt=2) = "%0#{fmt}x" % self
    def bin(fmt=8) = "%0#{fmt}b" % self

    alias each times
    alias t times
    include Enumerable
  end

  refine String do
    def clines = lines.map(&:chomp)

    alias c chars
    alias l lines
    alias b bytes

    def bin = to_i(2)
  end

  refine Enumerable do
    def e(...) = each()

    def permutation(...) = to_a.permutation(...)
    alias perm permutation

    def combination(...) = to_a.combination(...)
    alias comb combination

    def powerset = to_a.then { _1.length.times.map(&_1.method(:combination)).reduce(&:chain) }

    def cross(*args)
      args.empty? ? self : flat_map { |v| args[0].cross(*args[1..]).map { [v, *_1]} }
    end

    def zip2(*a)
      return to_enum __method__, *a unless block_given?
      vals = [self, *a].map(&:each)
      loop do 
        given = vals.map { _1.next rescue nil }
        break if given.compact.empty?
        yield given
      end
    end
  end
end
