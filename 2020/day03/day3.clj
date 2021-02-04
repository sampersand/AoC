(ns aoc.2020.day3)

; Sled down the slope!
(defn sled [lines right down]
	(->> lines
		(map cycle)
		(#(map vector % (map (partial * right) (range))))
		rest
		(take-nth down)
		(map (partial apply nth))
		(filter #{\#})
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
    ; rest
    ))

; The lines for this file
(def lines (get-lines "day3.txt"))
(println "Part1:" (part1 lines))
(println "Part2:" (part2 lines))
