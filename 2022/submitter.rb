require 'net/http'
require 'date'
require 'cgi'

module Kernel
  def ssleep(amnt)
    amnt = amnt.to_i
    begin
      amnt -= sleep amnt
    end while amnt.positive?
  end
end

class AocProblem
  DEFAULT_SESSION_PATH = File.join __dir__, 'session'

  def initialize(day, year, session: File.read(DEFAULT_SESSION_PATH).strip)
    @day, @year = day.to_i, year.to_i
    @session = session
  end

  def submit(data, part)
    raise ArgumentError, 'need part 1 or 2' unless part == 1 || part == 2

    input_url = aoc_url 'answer'
    http = Net::HTTP.new(input_url.host, 443)
    http.use_ssl = true

    request = Net::HTTP::Post.new(input_url.request_uri)
    set_cookie request
    request.set_form_data Hash[level: part, answer: data.to_s]
    loop do
      break case b = http.request(request).body
            when /You don't seem to be solving the right level/ then :already_done
            when /That's the right answer!/                     then :correct
            when /That's not the right answer\./                then :incorrect
            when /You have (\d+)s? left to wait/
              puts "Oops not enough time has elapsed!. Going to wait #$1s"
              $stdout.flush
              ssleep $1.to_i
            else
              warn "unknown result: #{b}"
              :unknown
            end
    end
  end

  def download(
    force: false,
    wait: Date.new(@year, 12, @day.to_i).to_time > Time.now,
    filename: File.join(File.dirname(caller.last[/\A(.*?):/, 1]), "day#@day.txt"),
    set_stdin: true
  )
    if wait
      puts "Going to wait #{secs = seconds_until_midnight}s before downloading"
      $stdout.flush
      ssleep secs
    end

    File.delete filename rescue nil if force
    File.write filename, fetch_input unless File.exist? filename

    $data = File.read filename
    $stdin = $data.each_line if set_stdin
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

def download!(year=Time.now.year, day=caller.last[/day(\d+)\.rb/, 1].to_i, **kw)
  year, day = day, year if year > day # lmao, in case i forget the order
  warn "aoc already exists, overwriting" if $aoc
  ($aoc = AocProblem.new(year, day)).download(**kw)
end

def submit!(...)
  puts $aoc.submit(...)
end
