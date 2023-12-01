
module Aoc
  refine Integer do
    def x = Position[_1, 0, 0]
    def y = Position[0, _1, 0]
  end

  class Grid
    class Position < Array
      def self.new(*args)
        self[*args.flatten]
      end

      def [](*) = super || 0
      def x = self[0]
      def y = self[1]
      def z = self[2]
      alias dimensions length
      alias dims length

      def inspect = super.to_s.tr('[]','()')
    end

    include Enumerable

    # def self.[](*rows)
    #   recur = proc { |ele, *coords|
    #   }
    #   rows.

    # def self.from_stdin(stdin = $stdin)
    def self.from_enum(enum)
      new.tap do |grid|
        enum.each_with_index do |row, x|
          row.each_with_index do |ele, y|
            grid[x, y] = ele
          end
        end
      end
    end

    def initialize(elements = {})
      @elements = elements
    end

    def [](*coords) @elements[Position.new(coords)] end
    def []=(*coords, ele) @elements[Position.new(coords)] = ele end

    def positions = @elements.keys
    def each(all_as_one = nil, &block)
      return to_enum __method__. all_as_one unless block_given?

      @elements.each do |coords, value|
        case block.arity
        when 1 then yield value
        when 2 then yield value, coords
        else        yield value, *coords
        end
      end
    end

    def neighbors(*position)
      pos = Position[*position.flatten]
    end

    def minmax_x = positions.map(&:x).minmax
    def min_x = minmax_x[0]
    def max_x = minmax_x[1]
    def x_range = min_x..max_x

    def minmax_y = positions.map(&:y).minmax
    def max_y = minmax_y[1]
    def min_y = minmax_y[0]

    def minmax_z = positions.map(&:z).compact.minmax
    def max_z = minmax_z[1]
    def min_z = minmax_z[0]

    def dimensions
      if $DEBUG
        fail unless positions.map(&:dimensions).minmax.uniq.one?
      end

      @elements.first.dimensions
    end

    def positions_range
      dimensions.times.map { |n|
        Range.new(*positions.filter_map { _1[n] }.minmax)
      }
    end

    # FIXME: make this also show nil for things out of bounds.
    def to_a
      eles = []
      offsets = [min_x&.-@, min_y&.-@, min_z&.-@].compact

      fill_eles = ->eles, (rp, *rest) {
        if rest.empty?
          eles.concat [nil] * rp.count
        else
          rp.each do
            eles << [].tap { fill_eles[_1, rest] }
          end
        end
      }

      fill_eles[eles, positions_range]

      @elements.each do |key, value|
        key = key.to_a
        x = key[..-2].zip(offsets).reduce(eles) { _1[_2[0] + _2[1]] ||= [] }
        x[key[-1] + offsets[-1]] = value
      end

      eles
    end

    def rough_to_s(empty = '.')
      string = (empty * (max_x - min_x).abs + "\n") * (max_y - min_y).abs
      to_a.map do |row|
        row.map { _1.nil? ? empty : _1 }.join
      end.join "\n"
    end
  end
end
