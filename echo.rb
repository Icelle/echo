def playback(say)
  if say == "Nothing!"
    return "Ok, fine!"
  elsif say == "I have a lot to say"
    puts "Ok, let's hear it!"
    print "> "
    say = gets.chomp
    inputs = []
    until say.downcase == "done"
      inputs.push(say)
      print "> "
      say = gets.chomp
    end
    you_said = ""
    inputs.each_with_index do |input, index|
      if index == 0
        prefix = "You said: "
      elsif index == inputs.length - 1
        prefix = "Finally you said: "
      else
        prefix = "Then, you said: "
      end
      you_said = you_said + prefix + input + "\n"
    end
     return you_said + "Phew! Glad you got all #{inputs.length} of those things off your chest!"
  else
    return "You said: #{say}"
  end
end

puts "What do you want to say?"
print "> "
say = gets.chomp
puts playback(say)
