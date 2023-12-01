module Aoc
  refine Integer do
    def x(...) = Position.unit(self, 0, ...)
    def y(...) = Position.unit(self, 1, ...)
    def z(...) = Position.unit(self, 2, ...)
  end

  class Position
    @default_dimension = 2

    class << self
      attr_reader :default_dimension

      def default_dimension=(dimension)
        unless 2 <= dimension
          raise ArgumentError, "dimension must be greater than two (#{dimension} is too large)"
        end

        @default_dimension = dimension
      end

      def zero(dims: default_dimension)
        new(0, dims: dims)
      end

      def unit(value, pos, ...)
        new(*[0] * pos, value, ...)
      end

      def unit_vectors(dims: default_dimension)
        dims.times.map { unit(1, _1, dims: dims) }
      end

      def from(*args, **kw)
        args.flatten!
        return args[0] if args.one? && args[0].is_a?(Position)

        new(*args, **kw)
      end

      def [](*args)
        new(args, dims: args.length)
      end
    end

    def initialize(*args, dims: self.class.default_dimension)
      @pos = args

      if dims
        if length < dims
          raise ArgumentError, "Given dimension array too large (the given #{length} is larger than expected #{dims})"
        end

        @pos.concat [0] * (dims - @pos.length)
      end

      freeze
    end

    protected :pos

    def [](dimension) = @pos.fetch(dimension, 0)

    def to_a = @pos
    def dimensions = @pos.length
    alias dims dimensions
    alias length dims

    def x = self[0]
    def y = self[1]
    def z = self[2]
    def w = self[3]

    def inspect = @pos.to_s.tr('[]','()')
    alias to_s inspect

    def each(...) = @pos.each(...)

    def ==(rhs) = rhs.is_a?(Position) && @pos == rhs.pos
    alias eql? ==
    def hash = @hash ||= @pos.hash

    def zip_each(rhs, &block)
      Position.from(*@pos.zip(rhs).map(&block), dims: [length, rhs.length].max)
    end

    def map(&block)
      Position.from(@pos.map(&block), dims: dims)
    end

    def +(rhs) = zip_each(rhs) {_1 + (_2||0)}
    def -(rhs) = zip_each(rhs) {_1 - (_2||0)}
    def *(rhs) = map { _1 * rhs }

    def neighbors_adjacent
      Position.unit_vectors(dims: dimensions).flat_map { [self + _1, self - _1] }
    end

    def neighbors_all
      ([-1, 0, 1] * dims)
        .combination(2)
        .uniq
        .-([[0] * dims])
        .sort
        .map { self + _1 }
    end
  end
end

class Bar < Aoc::Position
  self.default_dimension = 3
  p new 1
end

using Aoc
Aoc::Position.default_dimension = 3
# p Aoc::Position[3, 4].neighbors_adjacent
p Aoc::Position[0,0].neighbors_all
# p Aoc::Position.new(1, 0) + 12.y#.neighbors4
# p Aoc::Position.new(1, 0) - 12.y#.neighbors4
# p Aoc::Position.new(1, 0) * 12#.neighbors4
