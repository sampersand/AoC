require 'pathname'
require 'stringio'
require 'net/http'
require 'date'
require 'cgi'

require_relative 'submitter'
require_relative 'global'

class Aoc
  DEFAULT_SESSION_PATH = File.join(__dir__, '..', 'session')

  def self.stringy(value)
    case value
    when String then value
    when Integer then value.to_s
    else raise ArgumentError, "expected a String or Integer, got #{value.class}", caller(1)
    end
  end

  attr_reader :day, :year

  def initialize(
    year:,
    day:,
    root: File.join(Dir.pwd, "day#{day}"),
    session: File.read(DEFAULT_SESSION_PATH).strip
  )
    @year, @day, @session = year.to_i, day.to_i, session
    @root = Pathname(root)
    @test_cases = { 1 => [], 2 => [] }
  end

  def inspect = "<Aoc::Problem year=#@year day=#@day>"


  # def setup!(force: false)
  #   @root.mkdir unless @root.exist?
  #   download! unless input_path.exist? && !force
  # end

  # def download!
  #   input_path.write fetch_input
  # end

  ##################
  # Fetching input #
  ##################

  attr_writer :input
  # def input
  #   # if the input already exists, just return that
  #   return @input if @input
  #   input_path.read

  #   @input ||= input_path.read

  # INVALID_INPUT = "Please don't repeatedly request this endpoint before it unlocks! The calendar countdown is synchronized with the server time; the link will be enabled on the calendar the instant this puzzle becomes available."
  attr_writer :input # so you can manually overwrite
  def input
    @input ||= input_path.read
  rescue Errno::ENOENT
    save_input download_input
    retry
  end

  def input_path = @root / "input.txt"
  def download_input = Submitter.send_request(section: 'input', year: @year, day: @day, session: @session)
  def save_input(input) = input_path.write(input)

  ###############
  # Submissions #
  ###############
  def submit!(part:, answer:)
    unless part == 1 || part == 2
      raise ArgumentError, "Must give either `1` or `2` for part, was given: #{part.inspect}"
    end

    Submitter.submit_part(part: part, answer: Aoc.stringy(answer), year: @year, day: @day, session: @session)
  end

  ##########
  # Part 1 #
  ##########
  def part1(&block)
    raise ArgumentError, 'Must give a block to execute' unless block_given?
    run_tests(part: 1, &block) ? puts("Part 1 tests succeeded") : puts("Part 1 tests failed")
  end

  def part2(&block)
    raise ArgumentError, 'Must give a block to execute' unless block_given?
    run_tests(part: 2, &block) ? puts("Part 1 tests succeeded") : puts("Part 2 tests failed")
  end

  ###########
  # Testing #
  ###########

  # Runs all tests cases for `part` against `block`, making sure the output is correct.
  def run_tests(part:, &block)
    raise ArgumentError, 'Must give a block to test' unless block_given?
    raise ArgumentError, "Part must be either `1` or `2`, not #{part.inspect}" unless part == 1 || part == 2

    tests = @test_cases.fetch(part)
    if tests.empty?
      puts "no tests for Part #{part}, skipping."
      return true
    end

    # Note: `run_test` will emit a message saying failure.
    tests.all? do |(input, answer)|
      run_test(input: input, expected: answer, &block)
    end
  end

  def run_test(input:, expected:, &block)
    given = run(input: input, &block)
    if given == expected
      puts "Correct, #{expected.inspect} == #{given.inspect}"
    end

    puts <<~EOS
      Wrong!
        correct: #{expected.inspect}
        given: #{given.inspect}
    EOS
    false
  end

  def run(input:)
    old_stdin = $stdin
    $stdin = StringIO.new(input)
    Aoc.stringy yield $stdin
  ensure
    $stdin = old_stdin
  end

  #########################
  # Running your solution #
  #########################

  attr_reader :test_cases
  def set_part1_example(input:, answer:)
    @test_cases[1] << [input, Aoc.stringy(answer)]
  end

  def set_part2_example(input:, answer:)
    @test_cases[2] << [input, Aoc.stringy(answer)]
  end
end
__END__
  def part1(&block)
    puts "Part 1: #{run_part_internal(@part1, &block)}"
  end

  def part1!(...)
    value = run_part_internal(@part1, ...) or return
    puts Submitter.submit_part(part: 1, answer: value, year: @year, day: @day, session: @session)
  end

  def part2(&block)
    puts "Part 2: #{run_part_internal(@part2, &block)}"
  end

  def part2!(...)
    value = run_part_internal(@part2, ...) or return
    puts Submitter.submit_part(part: 2, answer: value, year: @year, day: @day, session: @session)
  end

  private

  def run_part_internal(part, &block)
    raise "expected a block" unless block_given?
    run_tests_for(part, &block) or return
    run(input: input, &block)
  end

  def run_tests_for(part, &block)
    part.all? do |(input, answer)|
      run_test(input: input, expected: answer, &block)
    end
  end


  def problem_relase_time
    Date.new(@year, 12, @day).to_time
  end

  def seconds_until_midnight
    problem_relase_time.to_i - Time.now.to_i
  end
end

aoc = Aoc.new(year: 2023, day: 3)
# aoc.setup!
__END__
def setup!(year: Time.now.year, day: caller.last[/(day|\/)?(\d+)\.rb/, 1].to_i, **kw)
  $aoc = Aoc.new(year: year, day: day, **kw)
end

def part1(submit = false)
  old_stdin = $stdin
  [] $stdin = 
ensure
  $stdin = old_stdin
end

def part1!(...) = part1(...) && submit!

__END__

  def initialize(day, year, session: File.read(DEFAULT_SESSION_PATH).strip)#, push: true)
    @day, @year = day.to_i, year.to_i
    @session = session
    # @push = push
  end

def setup!(year: Time.now.year, day: caller.last[/(day|\/)?(\d+)\.rb/, 1].to_i))
  puts "aoc already exists" if @day or @year or @tests
  @year, @day = year, day
  @tests = []
end

def download!

def tc(answer, src=DATA) = @tests << [answer, src]
alias tc! tc
alias testcase! testcase

def part1(&block)
  aoc = Aoc.new

# def download!(year=Time.now.year, day=caller.last[%r{/day(\d+)/}, 1].to_i, push: true, **kw)
def download!(year=Time.now.year, day=caller.last[/day(\d+)\.rb/, 1].to_i, **kw)
  year, day = day, year if year > day # lmao, in case i forget the order
  @year, @day = year, day
  puts "aoc already exists, overwriting" if $aoc
  # ($aoc = AocProblem.new(year, day, push: push)).download(**kw)
  @data = ($aoc = AocProblem.new(year, day)).download(**kw)
end
