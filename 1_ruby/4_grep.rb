RED = "\033[31m"
RESET = "\033[0m"

pattern = ARGV.shift
exit "You must specify a pattern" unless pattern

filename = ARGV.shift
exit "You must specify a file name!" unless filename

grep_file = File.new filename

cnt = 1

while line = grep_file.gets
  if line.match pattern
    line.sub! pattern, "#{RED}#{pattern}#{RESET}"
    puts "#{cnt}: #{line}"
  end
  cnt += 1
end
