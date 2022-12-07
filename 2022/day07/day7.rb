require 'pathname'

# Set standard in
$stdin = open 'day7.txt'

# The block is run whenever an unknown key is accessed
FS = Hash.new { |fs, path| fs[path] = [] }

pwd = Pathname('')
while line = gets(chomp: true) # While there's lines left to read
  # Use a regex as the switch. The special variable `$'` means everything
  # after the current regex match, whereas `$1` means the first group.
  case line
  when /\$ cd / then pwd /= $' # update pwd. `Pathname` handles `..` properly.
  when /dir /   then FS[pwd].push FS[pwd/$'] # folders are list of subfolders
  when /(\d+) / then FS[pwd].push $1.to_i    # Files are integers
  end
end

# We don't care about names anymore, so just map folders to their sizes.
size_of = ->value { value.is_a?(Integer) ? value : value.sum(&size_of) }
folder_sizes = FS.values.map(&size_of)

unused = 70000000 - folder_sizes[0] # first size is always root

# Print out the desired results
puts folder_sizes.select { _1 < 100000 }.sum
puts folder_sizes.select { 30000000 <= unused + _1 }.min
