(ns aoc.2020.day3)

; Sled down the slope!
(defn sled [lines right down]
	(->> lines
		(#(map vector % (range)))
		(filter (comp zero? #(mod % down) second))
		(map (fn [[line idx]] [line (mod (* (inc idx) right) (count line))]))
		(map (partial apply nth))
		(filter (partial = \#))
		count))

; Do part 1
(defn part1 [lines]
	(sled lines 3 1))

; Do part 2
(defn part2 [lines]
	(->> lines
		(partial apply sled)
		(#(map % [[1 1] [3 1] [5 1] [7 1] [1 2]]))
		(reduce *)))


; Get the list of lines from a file
(defn get-lines [file]
  (->> file
    slurp
    clojure.string/split-lines
    rest))

; The lines for this file
(def lines (get-lines "day3.txt"))
(println "Part1:" (part1 lines))
(println "Part2:" (part2 lines))
	; (reduce * (map (partial apply sled lines) [[1 1] [3 1] [5 1] [7 1] [1 2]])))

; (-> lines
; 	(#(map vector %1 (range)))
; 	(#(map nth ))
; )
; )

; [[1,1], [3,1], [5,1], [7,1], [1,2]]
; 	.map do |r, d|
; 		idx = 0
; 		lines
; 			.lazy
; 			.each_slice(d)
; 			.map(&:first)
; 			.count { _1[(idx += r) % _1.length] == '#' }
; 			.tap { r == 3 and puts "Part 1: #{_1}" }
; 	end
; 	.reduce(&:*)
; 	.tap { puts "Part 2: #{_1}"  }

	; )
; (map vector foo (range)
; (prn (->> foo
; 	#('(% (count %)))
; 	#(range %1 %2)
; 	list (zipmap foo range(range (count foo)) foo)))
; (prn (for [x [0 1 2 3 4 5]
      ; :let [y (* x 3)]
      ; :when (even? y)]
  ; y))
; (def lines (get-lines "day3.txt"))
; (prn lines)
; (defn part1 [lines] (
	; reduce () '(0 0)
; ))

; (->> [1 2 3]
;    (reduce +)
;    println
; )

; ; (println (reduce + [1 2 3]))
