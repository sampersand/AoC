require 'matrix'

module Enumerable
	def gaze
		each do |*k|
			x = yield *k rescue break
			return x if x != '.'
		end
		nil
	end
end

DIRECTIONS = {}
class Matrix
	def gaze_around(row, col)
		west, east, south, north = DIRECTIONS[[row, col]]

		[
			west.gaze { self[row, _1] },
			east.gaze { self[row, _1] },
			north.gaze { self[_1, col] },
			south.gaze { self[_1, col] },
			north.zip(west).gaze { self[_1, _2] },
			north.zip(east).gaze { self[_1, _2] },
			south.zip(west).gaze { self[_1, _2] },
			south.zip(east).gaze { self[_1, _2] },
		].count '#'
	end

	def step
		Matrix.build row_size, column_size do |row, col|
			count = gaze_around row, col
			case
			when self[row, col] == 'L' && count.zero? then '#'
			when self[row, col] == '#' && count >= 5 then 'L'
			else self[row, col]
			end
		end
	end
end

board = Matrix[*open('day11.txt').map(&:chomp).map(&:chars).reject(&:empty?)]

# Initialize direction arrays so we don't have to make a bajilion of them
board.each_with_index do |_, row, col|
	DIRECTIONS[[row, col].freeze] = [
		[*(col - 1).downto(0)].freeze,
		[*(col + 1).upto(board.column_size - 1)].freeze,
		[*(row - 1).downto(0)].freeze,
		[*(row + 1).upto(board.row_size - 1)].freeze,
	]
end

last = nil
last, board = board, board.step while last != board
puts board.count '#'
