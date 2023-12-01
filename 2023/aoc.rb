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
      if verbose?
        puts "[LOG] #{msg || yield}"
        $stdout.flush
      end
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

    # Aliases `puzzle_input` to other variants
    alias data puzzle_input
    alias data= puzzle_input=
    alias input puzzle_input
    alias input= puzzle_input=

    def submit(data, part=1)
      raise ArgumentError, "Part must be either 1 or 2" unless part==1 || part==2

      data = data.to_s
      puts "Submitting #{data.inspect} for part #{part}"
      parse_response submit_data! data, part
    end

    private

    def submit_data!(data, part)
      input_url = aoc_url 'answer'
      http = Net::HTTP.new(input_url.host, 443)
      http.use_ssl = true

      request = Net::HTTP::Post.new(input_url.request_uri)
      set_cookie request
      request.set_form_data Hash[level: part, answer: data]
      http.request(request).body
    end

    def parse_response(response)
      case b = 
      when /You don't seem to be solving the right level/ then "You've already solved this"
      when /You achieved\s*<em>\s*rank (\d+)/             then "Correct! You got rank #$1"
      when /That's the right answer!/                     then "Correct! (You didn't place...)"
      when /That's not the right answer\./                then "Incorrect :-("
      when /You have (\d+)s? left to wait/
        puts "Oops not enough time has elapsed!. Going to wait #$1s"
        $stdout.flush
        ssleep $1.to_i
      else
        warn "unknown result: #{b}"
        :unknown
      end
  end


    private

    def puzzle_release_time = Date.new(@year, 12, @day).to_time
    def seconds_until_release = puzzle_release_time - Time.now

    # Waits for the puzzle to be released.
    # 
    # If the puzzle is already released, this will be a no-op
    def wait_for_puzzle_to_be_released
      if (time_to_wait = seconds_until_release).negative?
        Aoc.log "Puzzle already released, not waiting"
        return
      end

      Aoc.log "Waiting #{time_to_wait}s"

      safe_sleep time_to_wait
    end

    # Downloads the data 
    def download!(filename: File.join(File.dirname($0), "day#@day.txt"), force: false)
      wait_for_puzzle_to_be_released 

      if !force && filename && File.exist?(filename)
        return File.read filename
      end

      Aoc.log "Downloading #@year/#@day #{filename && "(to #{filename})"}"

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

Aoc.verbose = true
p Aoc::Problem.new(2022, 2)
  .puzzle_input(filename: 'tmp.ignore', force: true)
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
