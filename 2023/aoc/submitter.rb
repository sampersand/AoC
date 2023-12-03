require 'net/http'
require 'date'
require 'cgi'

module Submitter
  module_function

  def aoc_uri(year:, day:, section:)
    URI "https://adventofcode.com/#{year}/day/#{day}/#{section}"
  end

  def set_session_cookie(request, session:)
    request['Cookie'] = CGI::Cookie.new('session', session).to_s.sub /;.*/, ''
    request['User-agent'] = 'github.com/sampersand/aoc/2020/submitter.rb'
  end

  def send_request(section:, form_data: nil, year:, day:, session:)
    uri = aoc_uri(year: year, day: day, section: section)
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.request_uri)
    set_session_cookie(request, session: session)

    request.set_form_data form_data if form_data

    http.request(request).body
  end

  def submit_part(part:, answer:, year:, day:, session:)
    raise ArgumentError, "part must be 1 or 2, not #{part.inspect}" unless part == 1 || part == 2
    fail "Answer must be a String or Integer" unless answer.is_a?(String) || answer.is_a?(Integer)

    loop do
      response = send_request(
        section: 'answer',
        form_data: { level: part, answer: answer.to_s },
        year: year,
        day: day,
        session: session
      )

      break case response
      when /You don't seem to be solving the right level/ then "You've already done this problem."
      when /You achieved\s*<em>\s*rank (\d+)/             then "Correct! You got rank #$1"
      when /That's the right answer!/                     then "Correct! You didn't score though :-("
      when /That's not the right answer\./                then "Incorrect :-("
      when /You have (\d+m )?(\d+)s? left to wait/
        time = ($1&.to_i||0)*60 + $2.to_i
        puts "Oops not enough time has elapsed!. Going to wait #{time}s"
        $stdout.flush
        ssleep time.to_i
        puts "Resubmitting..."
        next
      else
        warn "unknown response: #{response}"
        response
      end
    end
  end
end
