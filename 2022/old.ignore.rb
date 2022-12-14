require 'cgi'
require 'net/http'
require 'date'

module Kernel
  def safe_sleep time
    amnt = amnt.to_i
    begin
      amnt -= sleep amnt
    end while amnt.positive?
  end
end

module Aoc
  class << self
    attr_writer :verbose
    def verbose? = @verbose
    def log(msg=nil)
      puts "[LOG] #{msg || yield}" if verbose?
    end
  end
  @verbose = $VERBOSE

  class Problem
    # The default path for the aoc session token key.
    DEFAULT_SESSION_PATH = File.join __dir__, 'session'

    # The year and day of the problem.
    attr_reader :year, :day

    # Creates a new `Problem`.
    # - `year`: The year of the problem. It's automatically populated with the current year.
    # - `day`: The day of the problem. It's required.
    # - `session`: The aoc session token. It usually lasts a month, so you should only need to
    #   set it when you first log in for the year.
    def initialize(year=Time.now.year, day, session: File.read(DEFAULT_SESSION_PATH).strip)
      @year = year.to_i
      @day = day.to_i
      @session = session.to_s
      @puzzle_input = nil # Set it to nil so calling `puzzle_input` the first time won't warn us.
    end

    # The puzzle input for the current day.
    #
    # If `force` is enabled (which is the default if the input hasn't been set), then this will
    # cache the result of calling `download!` with all the arguments (including `force`).
    def puzzle_input(force: !@puzzle_input, **kw)
      if force
        @puzzle_input = nil 
        Aoc.log "`force` is supplied, #{@puzzle_input ? "re" : ""}downloading puzzle input"
      end

      @puzzle_input ||= download!(force: force, **kw)
    end

    # Allows you to manually set the puzzle input.
    attr_writer :puzzle_input

    # Aliases if
    alias data puzzle_input
    alias data= puzzle_input=
    alias input puzzle_input
    alias input= puzzle_input=

    # Returns the time the time when the puzzle is released
    def puzzle_release_time
      @puzzle_release_time ||= Date.new(@year, 12, @day).to_time
    end

    # Waits for the puzzle to be released.
    def wait_for_puzzle_to_be_released
      unless (time_to_wait = Time.now - puzzle_release_time).positive?
        Aoc.log "Puzzle already open, not waiting..."
        return
      end

      puts "Waiting #{time_to_wait}s"
      $stdout.flush # just to ensure it prints out

      safe_sleep time_to_wait
    end

    # Downloads the data 
    def download!(wait: true, filename: File.join(File.dirname($0), "day#@day.txt"), force: false)
      if force
        @puzzle_input = nil 
        Aoc.log "`force` is supplied, #{@puzzle_input ? "re" : ""}downloading puzzle input"
      end

      @puzzle_input ||= download!(force: force, **kw)

      wait_for_puzzle_to_be_released if wait

      if !force && filename && File.exist? filename
        return File.read filename
      end

      puzzle = download_puzzle_input
      File.write filename, puzzle if filename
      puzzle
    end

    private

    def aoc_url(section)
      URI "https://adventofcode.com/#@year/day/#@day/#{section}"
    end

    def set_cookie(request)
      request['Cookie'] = CGI::Cookie.new('session', @session).to_s.sub /;.*/, ''
    end

    def download_puzzle_input
      input_url = aoc_url 'input'
      http = Net::HTTP.new(input_url.host, 443)
      http.use_ssl = true

      request = Net::HTTP::Get.new input_url.request_uri
      set_cookie request
      http.request(request).body
    end
  end


  def parse_puzzle(puzzle, **options)
    contents
    # case options
    # in { lines:, chomp: true } then contents.lines(chomp: true)
    # in 
    # else contents
    # end
  end
end

p Aoc::Problem.new(2022, 2)
  .download!(filename: 'tmp.ignore', force: true)
__END__


    def download!
    def download(
      force: false,
      wait: Date.new(@year, 12, @day.to_i).to_time > Time.now,
      filename: File.join(File.dirname(caller.last[/\A(.*?):/, 1]), "day#@day.txt"),
      set_stdin: true,
      lines: false
    )

    # def download(
    #   force: false,
    #   wait: @wait && Date.new(@year, 12, @day.to_i).to_time > Time.now,
    #   filename: File.join(caller.last[/\A.*?day\d+(?=\/.*:)/], "day#@day.txt"),
    #   # filename: File.join(File.dirname(caller.last[/\A(.*?):/, 1]), "day#@day.txt"),
    #   set_stdin: true
    # )
      if wait
        puts "Going to wait #{secs = seconds_until_midnight}s before downloading"
        $stdout.flush
        ssleep secs
      end

      File.delete filename rescue nil if force
      File.write filename, fetch_input unless File.exist? filename

      $data = File.read filename
      # $stdin = $data.each_line if set_stdin
      $data = $data.lines.map(&:chomp) if lines
      $data
    end


    private

    def aoc_url(section)
      URI "https://adventofcode.com/#@year/day/#@day/#{section}"
    end

    def set_cookie(request)
      request['Cookie'] = CGI::Cookie.new('session', @session).to_s.sub /;.*/, ''
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
end
