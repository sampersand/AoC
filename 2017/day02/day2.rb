p File.readlines('input.txt')
  .sum { it.split.map(&:to_i).minmax.reduce(:-).abs }

p File.readlines('input.txt')
  .sum { |line| line.split.map(&:to_i).permutation(2)
      .sum { a, b = _1.divmod(_2); b.zero? ? a : 0  } }

__END__
puts File.readlines('input.txt') # split the input file into lines
  .map { |line| # map each line to:
    line.split          # split on whitespace
      .map(&:to_i)      # convert each element to an integer
      .minmax           # return an array of `[min,max]`
      .reduce(&:-).abs  # do `max-min`
  }
  .sum # sum up all the lines

p File.readlines('input.txt')
  .sum { |line|
    line
      .split
      .map(&:to_i)
      .permutation(2)
      .sum { |l, r|
        a, b = l.divmod(r)
        b == 0 ? a : 0
      }
    }

