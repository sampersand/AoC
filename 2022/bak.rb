# END {
#   Dir.chdir './day08' rescue nil
#   require_relative 'day08/day8.rb'
# }

module Aoc
  class Grid
    class Position
      def initialize(*coords) @coords = coords end

      def x = @coords[0]
      def y = @coords[1]
      def z = @coords[2]
      def to_a = @coords

      def inspect = @coords.to_s.tr('[]','()')
    end

    include Enumerable

    # def self.[](*rows)
    #   recur = proc { |ele, *coords|
    #   }
    #   rows.

    # def self.from_stdin(stdin = $stdin)
    def self.from_enum(enum)
      new.tap do |grid|
        enum.each_with_index do |row, y|
          row.each_with_index do |ele, x|
            grid[x, y] = ele
          end
        end
      end
    end

    def initialize(elements = {})
      @elements = elements
    end

    def [](*coords) @elements[Position.new(*coords)] end
    def []=(*coords, ele) @elements[Position.new(*coords)] = ele end

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

    def minmax_x = positions.map(&:x).minmax
    def min_x = minmax_x[0]
    def max_x = minmax_x[1]

    def minmax_y = positions.map(&:y).minmax
    def max_y = minmax_y[1]
    def min_y = minmax_y[0]

    def minmax_z = positions.map(&:z).minmax
    def max_z = minmax_z[1]
    def min_z = minmax_z[0]

    def to_a
      eles = []

      @elements.each do |key, value|
        x = key.to_a[..-2].reduce(eles) { _1[_2] ||= [] }
        x[key.to_a[-1]] = value
      end

      eles
    end

    # def rough_to_s(empty = '.')
    #   string = (empty * (max_x - min_x).abs + "\n") * (max_y - min_y).abs

    #   each do |ele, x, y|
    #     string[y][x] = ele.to_s
    #   end
    #   string
    # end
  end

  module Enumerable
  # module AoC
  #   refine Enumerable do
      def each_with_matrix(method = :each)
        method = method.to_proc
        return to_enum __method__, method unless block_given?

        each_with_index do |row, x|
          method.call(row).each_with_index do |ele, y|
            yield ele, x, y
          end
        end
      end
    end
  # end
end

grid = Aoc::Grid.new

grid[0,0] = 1
grid[0,1] = 2
grid[1,0] = 3
grid[1,1] = 4
grid[2,2] = 4

p grid.to_a
