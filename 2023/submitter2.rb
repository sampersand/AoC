require 'pathname'
require 'stringio'
require 'net/http'
require 'date'
require 'cgi'

class Aoc
  DEFAULT_SESSION_PATH = File.join __dir__, 'session'

  def initialize(
    year:,
    day:,
    session: File.read(DEFAULT_SESSION_PATH).strip,
    root: File.join(Dir.pwd, "day#{day}")
  )
    @year, @day, @session = year.to_i, day.to_i, session
    @root = Pathname(root)
    @part1 = []
    @part2 = []
  end

  def input_path = @root / "input.txt"
  def real_input = @input ||= input_path.read

  def setup!(force: false)
    @root.mkdir unless @root.exist?
    download! unless input_path.exist? && !force
  end

  def download!
    input_path.write fetch_input
  end

  def set_part1_example(input:, answer:)
    @part1 << [input, answer]
  end

  def set_part2_example(input:, answer:)
    @part2_input = input
    @part2_answer = answer.to_s
  end

  def part1(&block)
    puts part1_internal(&block)
  end

  def part1!(...) = submit!(part1_internal(...) || return)

  private

  def part1_internal(&block)
    raise "expected a block" unless block_given?
    run_tests_for!(@part1, &block) or return
    run(input: real_input, &block)
  end

  def run_tests_for!(part, &block)
    part.all? do |(input, answer)|
      run_test(input: input, expected: answer, &block)
    end
  end

  def run(input:)
    old_stdin = $stdin
    $stdin = StringIO.new(input)
    yield $stdin
  ensure
    $stdin = old_stdin
  end

  def run_test(input:, expected:, &block)
    given = run(input: input, &block)
    return true if given == expected
    puts "Wrong!\n\tCorrect: #{expected.inspect}\n\tgiven: #{given.inspect}"
    false
  end

  def aoc_url(input)
    URI "https://adventofcode.com/#@year/day/#@day/#{input}"
  end

  def set_cookie(request)
    request['Cookie'] = CGI::Cookie.new('session', @session).to_s.sub /;.*/, ''
    request['User-agent'] = 'github.com/sampersand/aoc/2020/submitter.rb'
  end

  def fetch_input
    input_url = aoc_url 'input'
    http = Net::HTTP.new(input_url.host, 443)
    http.use_ssl = true

    request = Net::HTTP::Get.new input_url.request_uri
    set_cookie request
    http.request(request).body
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
  warn "aoc already exists" if @day or @year or @tests
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
  warn "aoc already exists, overwriting" if $aoc
  # ($aoc = AocProblem.new(year, day, push: push)).download(**kw)
  @data = ($aoc = AocProblem.new(year, day)).download(**kw)
end
