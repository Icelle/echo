def playback(say)
  return "You said: #{say}"
end

puts "What do you want to say?"
print "> "
say = gets.chomp
puts playback(say)
