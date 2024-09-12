require_relative 'mastermind'

class CodeMaker
  def initialize(player)
    @colors = player.pick_colors
  end

  attr_reader :colors
end

class HumanCodeMaker << CodeMaker
  def initialize
    @colors = pick_colors
  end

  def pick_colors
    loop do
      print "Enter your four colors (red, blue, yellow, green, orange, purple): "
      input = gets.chomp.downcase.split(', ')
      return input if input.length == 4 && input.all? { |color| ["🟢", "🔴", "🟡", "🔵", "🟣"].any? color }
    end
  end

  def print_rules
    puts "Hello, CodeMaker.
    
    \nYou have to create a color code difficult to guess to the Code Breaker.

    You will enter a code and the Code breaker will try to guess it. 

    Please enter a code and the Code breaker will try to guess, an example like this:

    green, green, blue, blue
    "
  end
end