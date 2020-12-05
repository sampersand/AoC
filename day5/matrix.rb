require 'matrix'

class Walker < Matrix
	attr_reader :x, :y

	def self.build(*a, x: 0, y: x, &b)
		n = super(*a, &(b || proc{0}))
		n.set x, y
	end

	def ele; self[x, y] end
	alias get ele

	def set(x, y) @x, @y = x, y; validate_cursor!; self end
	alias set! set

	def x=(val); @x = val; validate_cursor! end
	def y=(val); @y = val; validate_cursor! end
	def width; to_a.first.length end
	def height; to_a.length end

	def in_bounds?(row, col) (0...width).include?(row) && (0...height).include?(col) end
	def cursor; [x, y] end

	def validate_cursor!
		raise "Out of bounds! (cursor=#{cursor}, bounds=#{[width-1, height-1]})" unless in_bounds?(*cursor)
	end

	def n!(amnt=1) self.y += amnt; self end
	def s!(amnt=1) self.y -= amnt; self end
	def e!(amnt=1) self.x += amnt; self end
	def w!(amnt=1) self.x -= amnt; self end
	def ne!(amnt=1) n!(amnt).e!(amnt) end
	def nw!(amnt=1) n!(amnt).w!(amnt) end
	def se!(amnt=1) s!(amnt).e!(amnt) end
	def sw!(amnt=1) s!(amnt).w!(amnt) end

	alias north! n!
	alias south! s!
	alias east! e!
	alias west! e!


	def inspect
		super.sub 'Walker', "Walker(#@x, #@y)"
	end

	def to_s(fmt=nil, &b)
		b ||= (fmt || "%s").method :%
		to_a
			.each_with_index
			.map { |row, ridx|
				row.each_with_index
					.map { |ele, cidx| cursor == [ridx, cidx] ? "[#{b.call ele}]" : " #{b.call ele} "}
					.join
			}.join "\n"
	end
end
