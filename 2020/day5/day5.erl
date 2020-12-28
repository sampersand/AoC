% Day 5 in Erlang.
% I decided against the `tr` trick, as I wouldn't learn as much about the language.
-module(day5).
-export([main/1]).
-import(string, [slice/3]).
-import(lists, [map/2, min/1, max/1, seq/2, subtract/2, nth/2]).

scan([Front], Front, _, Min, _) -> Min;
scan([Back ], _, Back, _, Max) -> Max;
scan([Front | T], Front, Back, Min, Max) -> scan(T, Front, Back, Min, (Min + Max) div 2);
scan([Back  | T], Front, Back, Min, Max) -> scan(T, Front, Back, (Min + Max) div 2+1, Max).

sum_line(Line) -> 
	scan(slice(Line, 0, 7), $F, $B, 0, 127) * 8
		+ scan(slice(Line, 7, length(Line)+1), $L, $R, 0, 7).

readlines() -> 
	case io:fread("", "~s") of 
		eof -> [];
		{ok, Value} -> readlines() ++ Value
	end.

main (_) ->
	Total = map(fun (X) -> sum_line(X) end, readlines()),
	
	Min = min(Total),
	Max = max(Total),

	io:format("Part 1: ~B~n", [Max]),
	io:format("Part 2: ~B~n", [nth(1, subtract(seq(Min, Max), Total))]).
