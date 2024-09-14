require 'colorize'
# require_relative 'code_maker'

module Mastermind
  COLORS = ["🟢", "🔴", "🟡", "🔵", "🟣"]
  TURNS = 12

  def initialize(code_maker)
    rules
    @random_code = code_maker.new().colors
    play
  end

  def pick_random_code
    clone_array = COLORS.dup
    loop = clone_array.size * 3
    loop.times { |counter| clone_array << clone_array[counter] }
    clone_array.sample(4)
  end
 
  def rules
    puts "There are 5 colors you can choose:

    🟢 - Green
    🔴 - Red
    🟡 - Yellow
    🔵 - Blue
    🟣 - Purple

    \nYou have to select 4 random colors until guess the correct code by Code Moker, like this: \norange, red, green, yellow\n\nIf the input format is not right you will see this error:
    \n#{"The input format is not right. Try again".colorize(:red)}
    
    \n#{"You have 12 attempts to guess the code".colorize(:blue)}

    \nThe code maker will give you feedback like this:

    🟥 - Correct color and position
    🔲 - Correct color but wrong position
    
    \nGood Luck!  
    "
  end

  def try_guess
    puts 'Try to guess the code make by the Code Maker'
    verify_code_format
  end

  def self.verify_code_format
    guess_code = gets.chomp
    regular_expression = /^(?i)(purple|green|red|yellow|blue)(,\s*(purple|green|red|yellow|blue)){3}$/
    until regular_expression.match(guess_code)
      puts "\n#{"The input format is not right. Try again".colorize(:red)}"
      guess_code = gets.chomp
    end
    guess_code.downcase
  end

  def self.from_code_to_color(code)
    color_array = []
    code.split.each do |color|
      color_array << "🟢" if color.include? "green"
      color_array << "🔴" if color.include? "red"
      color_array << "🟡" if color.include? "yellow"
      color_array << "🔵" if color.include? "blue"
      color_array << "🟣" if color.include? "purple"
    end
    color_array
  end

  def code_match?(user_code)
    from_code_to_color(user_code) == @random_code
  end

  def show_turn(turn_number)
    puts "Turn ##{turn_number} of 12".colorize(:yellow)
  end

  def give_feedback(code_guees)
    color_code = from_code_to_color(code_guees)
    feedback = []
    color_code.each_with_index do |color, index|
      if color_code[index] == @random_code[index]
        feedback << "🟥"
      elsif @random_code.include? color
        feedback << "🔲"
      end
    end
    p feedback.shuffle
  end

  def play
    TURNS.times do |time|
      show_turn(time + 1)
      user_code = try_guess
      give_feedback(user_code)
      if code_match?(user_code)
        puts "\n#{"Congratulations! You guessed the correct code in #{time + 1} turns".colorize(:green)}"
        break
      end
    end
  end

end

# Test the Mastermind class
# mm = Mastermind.new(HumanCodeMaker)