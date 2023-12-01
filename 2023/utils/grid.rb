require_relative 'position'
module Aoc
  class Grid
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

    def [](...)
      @elements[Position.from(...)]
    end

    def []=(*coords, ele)
      @elements[Position.from(*coords)] = ele
    end

    def positions = @elements.keys
    def each(&block)
      return to_enum __method__ unless block_given?

      @elements.each do |coords, value|
        case block.arity
        when 1 then yield value
        when 2 then yield value, coords
        else        yield value, *coords
        end
      end
    end

    def position?(*pos)
      @elements.include? Position.from(*pos, dim: dimensions)
    end

    def x_range = Range.new(*positions.map(&:x).minmax)
    def min_x = x_range.min
    def max_x = x_range.max

    def y_range = Range.new(*positions.map(&:y).minmax)
    def min_y = y_range.min
    def max_y = y_range.max

    def z_range = Range.new(*positions.map(&:z).minmax)
    def min_z = z_range.min
    def max_z = z_range.max

    def dimensions
      if $DEBUG
        fail unless positions.map(&:dimensions).minmax.uniq.one?
      end

      @elements.first[0].dimensions
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

    def inspect = "Grid(#{length})"

    def rough_to_s(empty = '.')
      string = (empty * (max_x - min_x).abs + "\n") * (max_y - min_y).abs
      to_a.map do |row|
        row.map { _1.nil? ? empty : _1 }.join
      end.join "\n"
    end
  end
end
