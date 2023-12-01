$stdin = open 'day1.txt'


p $stdin.sum { (_1[/\d/] + _1.reverse[/\d/]).to_i }
