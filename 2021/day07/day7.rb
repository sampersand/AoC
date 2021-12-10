$stdin = open('day7.txt') # omit if reading from stdin
groups =
    gets
    .split(',')
    .map(&:to_i)
    .then { |data|
      data
        .max
        .times
        .map { |n| data.map { (_1-n).abs } }
    }

p groups.map(&:sum).min
p groups.map { |g| g.sum { _1 * _1.succ / 2 } }.min

