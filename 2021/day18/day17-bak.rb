$stdin = open('day18.txt')
$stdin = DATA


def create((l, r), acc=[], depth=0)
  if r
    create(l, acc, depth + 1)
    create(r, acc, depth + 1)
  else
    acc.push(l + depth.i)
  end
  acc
end

def reduce(inp)
  i = 0
  while i < inp.length
    if inp[i].imag > 4
      l = inp.delete_at i
      r = inp[i]

      inp[i] = inp[i].imag.i - 1i

      inp[i-1] += l.real unless i.zero?
      inp[i+1] += r.real if inp[i+1]
      i = 0
    elsif inp[i].real >= 10
      half, round = inp[i].real.divmod 2
      inp[i] = half + inp[i].imag.i + 1i
      inp.insert i+1, half + round + inp[i].imag.i
      i = 0
    else
      i += 1
    end
  end
  inp
end

def combine(ary)
  x = [ary.shift, ary.shift]
  x = [x, ary.shift] until ary.empty?
  x
end

  # [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]],
  # [7,[5,[[3,8],[1,4]]]],
  # [[2,[2,2]],[8,[8,1]]],
  # [2,9],
  # [1,[[[9,3],9],[[9,0],[0,7]]]],
  # [[[5,[7,4]],7],1],
  # [[[[4,2],2],6],[8,7]],


p reduce create combine [
  [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]],
  [7,[[[3,7],[4,3]],[[6,3],[8,8]]]],
  [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]],
]
__END__
  x = []
  x. ary.shift until ary.empty?

p reduce create [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
exit
# p reduce [[[[4,3],4],4],[7,[[8,4],9]]]
# p reduce create [[[[[9,8],1],2],3],4]
p reduce create [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
# def solve(input, depth)
#   throw :split, if depth >= 4
# end

__END__
$input =
[ # 0
  [ # 1
    [ # 2
      [ # 3
        [ # 4
          4, # => 0+4i
          3  # => 1+4i
        ], #/4
        4    # => 2+3i
      ], #/3
      4      # => 3+2i
    ], #/2
    [ # 2
      7,     # => 4+2i
      [
        [
          8,
          4
        ],
        9
      ]
    ]
  ],
  [
    1,
    1
  ]
]

loop do
  catch :restart do
    solve $input, 0
    false
  end or break
end

__END__
$stack = []
def run(input,depth)
  return if input.is_a? Integer
  if depth >= 4
    throw :split, input
  end

  changes = false
  if (catch :restart do
    i = 0
    $stack.push [input, i]
    while i < input.length do
      $stack[-1][-1] = i

      p $input if i == 0
      s = (catch :split do
        run input[i], depth + 1
      end)
      if s
        catch :done1 do
          $stack.reverse.each do |inp, i_|
            (i_-1).downto 0 do |x|
              if inp[x].is_a? Integer
                p [inp, i_, inp[x], s[0], "A"]
                inp[x] += s[0]
                throw :done1
              end
            end
          end
          changes = 1
        end

        # (i+1).upto (input.length - 1) do |x|
        #   if input[x].is_a? Integer
        #     input[x] += s[1]
        #     break
        #   end
        # end
        catch :done1 do
          $stack.reverse.each do |inp, i_|
            (i_+1..).each do |x|
              break unless inp[x]
              if inp[x].is_a? Integer
                inp[x] += s[0]
                throw :done1
              end
              a = inp[x]
              while a.is_a? Array and a[0].is_a? Array
                a = inp[0]
              end
              a[0] += s[0]
              # if inp[x].is_a? Integer
              #   p [inp, i_, inp[x], s[0], "A"]
              #   inp[x] += s[0]
              #   throw :done1
              # end
            end
          end
          changes = 1
        end

        input[i] = 0
        $stack.pop
        throw :restart
        # i = 0
        next

      end
      if input[i].is_a?(Integer) && input[i] >= 10
        mod = input[i] % 2
        input[i] = [input[i] / 2, input[i]/ 2 + mod]
        # i = 0
        $stack.pop
        changes = 1
        throw :restart
        next
      end
        p $input

      i += 1
    end
    $stack.pop
    false
  end) 
    if depth == 0
      run input, depth
    else
      throw :restart
    end
  end
  run input, 0 if depth == 0
  # [[[[[9,8],1],2],3],4]
end


$input = x = [[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]
p (catch :done do
p run x, 0
x
end)
p $input
# input={}
# $stdin.map(&:chomp).each do |line|

# end

__END__
