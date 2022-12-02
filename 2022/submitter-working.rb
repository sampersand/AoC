require 'net/http'
require 'date'
require 'cgi'

SESSION = File.read(File.join __dir__, 'session').chomp

def aoc_url(year, day, section)
  URI "https://adventofcode.com/#{year}/day/#{day}/#{section}"
end

def download_data(year, day)
  input_url = aoc_url(year, day, 'input')
  http = Net::HTTP.new(input_url.host, 443)
  http.use_ssl = true

  request = Net::HTTP::Get.new(input_url.request_uri)
  request['Cookie'] = CGI::Cookie.new('session', SESSION).to_s.sub /;.*/, ''
  http.request(request).body
end

def submit!(
  data,
  part = ($part||=0; $part += 1),
  year: $year || Time.now.year,
  day: $day || caller.last[/day(\d+)\.rb/, 1]
)
  raise 'need part 1 or 2' unless part == 1 || part == 2
  input_url = aoc_url(year, day, 'answer')
  http = Net::HTTP.new(input_url.host, 443)
  http.use_ssl = true

  request = Net::HTTP::Post.new(input_url.request_uri)
  request['Cookie'] = CGI::Cookie.new('session', SESSION).to_s.sub /;.*/, ''
  request.set_form_data Hash[level: part, answer: data.to_s]
  puts http.request(request).body["That's the right answer!"] ? "correct!" : "nope :-("
end

def seconds_until_midnight
  Date.today.next_day.to_time.to_i - Time.now.to_i
end

def download!(
  year: Time.now.year,
  day: caller.last[/day(\d+)\.rb/, 1],
  force: false,
  wait: Date.new(year, 12, day.to_i).to_time > Time.now,
  filename: File.join(File.dirname(caller.last[/\A(.*?):/, 1]), "day#{day}.txt")
)
  $year ||= year
  $day ||= day

  if wait
    puts "Going to wait #{seconds_until_midnight}s before downloading"
    $stdout.flush
    # gotta `until` to ensure we wait for the full amount of time
    sleep seconds_until_midnight until Date.new(year, 12, day.to_i).to_time <= Time.now
  end

  File.delete filename rescue nil if force
  File.write filename, download_data(year, day) unless File.exist? filename

  $data = File.read filename
  $stdin = $data.each_line
end

