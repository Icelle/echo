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
    return multiline_speech(inputs)
  elsif say == "I have something prepared"
    puts "Ok, where can I find what you want to say?"
    print "> "
    speech = gets.chomp
    return get_file_input(speech)
  else
    return "You said: #{say}"
  end
end

def get_file_input(filename)
  if File.exists?(filename)
    puts "Loading #{filename}..."
    lines = File.readlines(filename)
    speech_lines = []
    lines.each do |line|
      line = line.chomp #take new lines out
      if line != "" #if empty, don't put it in speech line, populate speech_lines
        speech_lines.push(line)
      end
    end
    return multiline_speech(speech_lines)
  else
    puts "I couldn't find that file."
    puts "Where can I find what you say?"
    print "> "
    filename = gets.chomp
    get_file_input(filename)  #yes! I made a recursion!
  end

end

def multiline_speech(inputs)
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
end

puts "What do you want to say?"
print "> "
say = gets.chomp
puts playback(say)


