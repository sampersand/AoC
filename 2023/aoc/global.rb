require 'pathname'
require 'stringio'
return if defined? USING_DAY2
def aoc(year, day, session: nil, root: nil)
  year, day = day, year if day > 2000
  @year, @day = year, day

  @root = Pathname(root || Pathname($0).parent)
  @session = session || @root.parent.join('session').read

  @test_cases = { 1 => [], 2 => [] }
end

def input_path = @root / 'input.txt'
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

def testcase(part:, input: nil, answer:)
  input = @test_cases.fetch(1).last.first if input.nil? && part == 2
  raise "input must be supplied" unless input
  @test_cases.fetch(part) << [input, Aoc.stringy(answer)]
end

def submit!(part:, answer:)
  unless part == 1 || part == 2
    raise ArgumentError, "Must give either `1` or `2` for part, was given: #{part.inspect}"
  end

  Submitter.submit_part(part: part, answer: Aoc.stringy(answer), year: @year, day: @day, session: @session)
end

def part1(...) = catch(:norun){puts "Part 1: #{_part1(...)}"}
def part1!(...) = catch(:norun){puts "Response: #{submit!(part: 1, answer: _part1(...))}"}
def _part1(run = true)
  throw :norun unless run
  @test_cases.fetch(1).each do |(input, answer)|
    old_stdin, $stdin = $stdin, StringIO.new(input)
    given = Aoc.stringy yield $stdin
    puts "test answer: #{given}"
    if given != answer
      abort "Part 1 failed: given #{given.inspect}, expected #{answer.inspect}"
    end
  ensure
    old_stdin = $stdin
  end

  begin
    old_stdin, $stdin = $stdin, StringIO.new(download!(wait: false))
    Aoc.stringy yield $stdin
  ensure
    old_stdin = $stdin
  end
end

def part2(...) = catch(:norun){puts "Part 2: #{_part2(...)}"}
def part2!(...) = catch(:norun){puts "Response: #{submit!(part: 2, answer: _part2(...))}"}
def _part2(run = true)
  throw :norun unless run
  @test_cases.fetch(2).each do |(input, answer)|
    old_stdin, $stdin = $stdin, StringIO.new(input)
    given = Aoc.stringy yield $stdin
    puts "test answer: #{given}"
    if given != answer
      abort "Part 2 failed: given #{given.inspect}, expected #{answer.inspect}"
    end
  ensure
    old_stdin = $stdin
  end

  begin
    old_stdin, $stdin = $stdin, StringIO.new(download!(wait: false))
    Aoc.stringy yield $stdin
  ensure
    old_stdin = $stdin
  end
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

def testcase(part:, input:, answer:)
  @test_cases.fetch(part) << [input, Aoc.stringy(answer)]
end
