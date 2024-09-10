require 'colorize'

class Mastermind
  COLORS = ["🟢", "🔴", "🟡", "🔵", "🟣"]
  TURNS = 12

  def initialize
    @random_code = pick_random_code
    rules
  end

  def pick_random_code
    clone_array = COLORS.dup
    loop = clone_array.size * 3
    loop.times { |counter| clone_array << clone_array[counter] }
    clone_array.sample(4)
  end
 
  def rules
    puts "You have to select 4 random colors until guess the correct code by Code Moker, like this: \norange, red, green, yellow\n\nIf the input format is not right you will see this error:
    \n#{"The input format is not right".colorize(:red)}
    
    \n#{"You have 12 attempts to guess the code".colorize(:blue)}

    \nThe code maker will give you feedback like this:

    🟥 - Correct color and position
    🔲 - Correct color but wrong position
    
    \nGood Luck!  
    "
  end

  def try_guess
    puts 'Try to guess the code make by the Code Maker'
    gets.chomp
  end

  def verify_code_format(guess_code)
    regular_expression = /^(?i)(purple|green|red|yellow|blue)(,\s*(purple|green|red|yellow|blue))*$/
    until regular_expression.match(guess_code)
      guess_code = try_guessing 
    end
  end

  def code_match?(user_code)
    user_code == @random_code
  end
end

# Test the Mastermind class
mm = Mastermind.new
