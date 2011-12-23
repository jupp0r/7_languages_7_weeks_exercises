# build array
numbers = Array.new
16.times {numbers.push rand(100)}

# print first using each
i = 0
numbers.each do |n| 
  print "#{n}"
  if (i % 4) == 3
    print "\n"
  else
    print "\t"
  end
  i += 1
end

puts ""

# then using each_slice
numbers.each_slice(4) { |slice| puts slice.join("\t") }
