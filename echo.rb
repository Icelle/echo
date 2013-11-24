def playback(say)
  if say == "Nothing!"
    return "Ok, fine!"
  elsif say == "I have a lot to say"
    return "I don't have time for that right now!"
  else
    return "You said: #{say}"
  end
end

puts "What do you want to say?"
print "> "
say = gets.chomp
puts playback(say)
