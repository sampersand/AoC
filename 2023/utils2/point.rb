module Aoc
  class Point
    def self.from(*args)
      args = args.first.rect if args.length == 1 && args.first.is_a?(Complex)
      new(*args.flatten)
    end

    def self.new(*args)
      return super unless self == Point
      self[args.length].new(*args)
    end

    @classes = {}
    def self.[](dimensions, &block)
      @classes[dimensions] ||= Class.new(self) do
        const_set :DIMENSIONS, dimensions
        const_set :ORIGIN, new(*[0] * dimensions)
      end.tap { _1.instance_exec(&block) if block }
    end

    include Enumerable

    def initialize(*args)
      raise ArgumentError, "must be a subclass of point" if instance_of? Point
      args.flatten!

      unless args.length == dims
        raise ArgumentError, "expected #{dims} arguments, but got #{args.length}"
      end

      @coords = args
    end

    def dims = self.class::DIMENSIONS

    # Checks to see if `self` is equal to `rhs.to_a`
    def ==(rhs) = to_a == rhs.to_a
    alias eql? ==

    # Points hash the same as arrays.
    def hash = to_a.hash

    def x = @coords.fetch(0)
    def y = @coords.fetch(1)
    def z = @coords.fetch(2)
    def w = @coords.fetch(3)

    def to_s = "(#{@coords.join(', ')})"
    def inspect
      names = dims <= 4 ? %w[x y z w] : (0..).lazy.map{"D#{_1}"}
      "Point#{dims}D(#{zip(names).map{"#{_2}=#{_1}"}.join(', ')})"
    end

    def each(&block) = @coords.each(&block)
    def to_a = @coords
    alias to_ary to_a

    def dimensions = self.class::DIMENSIONS

    def euclidean(pos=self.class::ORIGIN, from: pos) = Math.sqrt zip(from).sum { (_1 - _2) ** 2 }
    alias euc euclidean

    def taxicab(pos=self.class::ORIGIN, from: pos) = zip(from).sum { (_1 - _2).abs }
    alias taxi taxicab

    def [](dimension) = @coords[dimensions]

    def origin? = all?(0)

    def +(rhs) = self.class.new(zip(rhs).map(&:sum))
  end

  Point2D = Point.[](2) do
    self::NORTH = new(0,  1)
    self::SOUTH = new(0, -1)
    self::EAST  = new(1,  0)
    self::WEST  = new(-1, 0)
  end

  Point3D = Point[3] do
  end
end
