
def doit(json)
	case json
	when Hash then (json = json.values).include?('red') ? 0 : doit(json)
	when Array then json.map { doit _1 }.sum
	else json.to_i
	end
end

require 'json'
p doit JSON[open('day12.txt', &:read)]
