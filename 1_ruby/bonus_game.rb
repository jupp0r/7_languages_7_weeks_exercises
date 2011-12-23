rand_n = 0
in_n = 0

while true
  rand_n = rand(10)
  puts "Enter number [0..9], -1 to abort"
  until (in_n = gets.to_i) == rand_n
    exit if in_n == -1
    if in_n < rand_n
      puts "Too low!"
    else
      puts "Too high!"
    end
  end
  puts "You win! Starting next round."
end
