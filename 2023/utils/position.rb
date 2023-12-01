module Aoc
  refine Integer do
    def x(...) = Position.unit(self, 0, ...)
    def y(...) = Position.unit(self, 1, ...)
    def z(...) = Position.unit(self, 2, ...)
  end

  class Position
    # The default dimension when creating a position. Most challenges require only
    # two dimensional position coordinates, but more complicated ones need 3d, and
    # occasionally even more. 
    @default_dimension = 2

    class << self
      attr_reader :default_dimension

      # Set the default dimension. It must be at least 1.
      def default_dimension=(dimension)
        unless dimension.positive?
          raise ArgumentError, "dimension must be positive (#{dimension} is too small)"
        end

        @defaut_dimension = dimension
      end

      # Creates a new zero `Position` with the given dimension.
      def zero(dims: default_dimension)
        new(0, dims: dims)
      end

      # Creates a `Position` of a single position with the given dimension.
      def unit(value, dim, ...)
        new(*[0] * dim, value, ...)
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
        new(*args, dims: args.length)
      end
    end

    def initialize(*args, dims: self.class.default_dimension)
      @pos = args

      if dims
        if dims < length
          raise ArgumentError, "Given dimension array too large (the given #{length} is larger than expected #{dims})"
        end

        @pos.concat [0] * (dims - @pos.length)
      end

      @hash = @pos.hash
      freeze
    end

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

    def ==(rhs) = rhs.is_a?(Position) && @pos == rhs.to_a
    alias eql? ==
    attr_reader :hash

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
        .combination(dims)
        .uniq
        .-([[0] * dims])
        .sort
        .map { self + _1 }
    end
  end

  class Position2 < Position
    @default_dimension = 2
    class << self
      alias [] from
    end
  end

  class Position3 < Position
    @default_dimension = 3
    class << self
      alias [] from
    end
  end
end
