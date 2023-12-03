USING_DAY2 = 1

require 'pathname'
require_relative 'submitter'
require 'stringio'

def stringy(value)
  case value
  when String then value
  when Integer then value.to_s
  else raise ArgumentError, "expected a String or Integer, got #{value.class}", caller(1)
  end
end

def aoc(year, day, session: nil, root: Pathname($0).parent.parent)
  # Allow for passing `day, year`
  year, day = day, year if day > 2000
  @year, @day = year, day

  @root = Pathname root
  @session = session || @root.join('session').read

  @test_cases = { 1 => [], 2 => [] }
end

def input_path = @root / "day#@day" / 'input.txt'
def fetch_input = Submitter.send_request(section: 'input', year: @year, day: @day, session: @session)

def download!(
  delete: false,
  wait: Date.new(@year, 12, @day.to_i).to_time > Time.now
)
  wait_until_midnight if wait

  input_path.delete rescue nil if delete
  input_path.write fetch_input unless input_path.exist?
  input_path.read
end
alias input download!


# def testcase(part:, input:, answer:)
#   @test_cases.fetch(part) << [input, stringy(answer)]
# end

def testcase(part:, input: nil, answer:)
  input = @test_cases.fetch(1).last.first if input.nil? && part == 2
  raise "input must be supplied" unless input
  input = input.read if input.is_a? IO
  @test_cases.fetch(part) << [input, stringy(answer)]
end

def submit!(part, answer)
  unless part == 1 || part == 2
    raise ArgumentError, "Must give either `1` or `2` for part, was given: #{part.inspect}"
  end

  r = Submitter.submit_part(part: part, answer: stringy(answer), year: @year, day: @day, session: @session)
  puts r
  if r["Correct! You got rank"]
    File.write File.join(File.dirname($0), File.basename($0, '.*') + "-part#{part}"  + File.extname($0)), File.read($0)
  end
end

%w[1 2].each do |part|
  eval <<~RUBY, binding, __FILE__, __LINE__
    def test#{part}(**k) = testcase(part: #{part}, **k)
    def part#{part}(...) = catch(:norun){puts "Part #{part}: \#{_part#{part}(...)}"}
    def part#{part}!(...) = catch(:norun){puts "Response: \#{submit!(#{part}, _part#{part}(...))}"}
    def _part#{part}(run = true)
      throw :norun unless run
      @test_cases.fetch(#{part}).each do |(input, answer)|
        old_stdin, $stdin = $stdin, StringIO.new(input)
        given = stringy yield $stdin
        puts "test answer: \#{given}"
        if given != answer
          abort "Part \#{part} failed: given \#{given.inspect}, expected \#{answer.inspect}"
        end
      ensure
        old_stdin = $stdin
      end

      begin
        old_stdin, $stdin = $stdin, StringIO.new(download!(wait: false))
        stringy yield $stdin
      ensure
        old_stdin = $stdin
      end
    end
  RUBY
end

private

module Kernel
  def ssleep(amnt)
    amnt = amnt.to_i
    begin
      amnt -= sleep amnt
    end while amnt.positive?
  end
end

def wait_until_midnight
  puts "Going to wait #{secs = seconds_until_midnight}s before downloading"
  $stdout.flush
  ssleep secs
end

def problem_relase_time
  Date.new(@year, 12, @day).to_time
end

def seconds_until_midnight
  problem_relase_time.to_i - Time.now.to_i
end
