require_relative 'point'

module Aoc
  class Grid
    def initialize(dims = 2)
      @pointcls = Point[dims]
      @grid = {}
    end

    def to_h = @grid
    alias to_hash to_h

    def [](...) = @grid[@pointcls.from(...)]
    def []=(*pointargs, value) @grid[@pointcls.from(*pointargs)] = value end

    def length = @grid.length
    alias size length
  end
end
