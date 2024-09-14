require_relative 'mastermind'

class CodeMaker
  include Mastermind
  def initialize
    # @colors = self.pick_colors
  end

  attr_reader :colors
end

class HumanCodeMaker < CodeMaker
  def pick_colors
    print_rules
    colors_from_user = input_colors
    Mastermind.from_code_to_color(colors_from_user)
  end

  def input_colors
    print "Enter your four colors (red, blue, yellow, green, orange, purple): "
    Mastermind.verify_code_format
  end

  def print_rules
    puts "Hello, CodeMaker.
    
    \nYou have to create a color code difficult to guess by the Code Breaker.

    You will enter a code and the Code breaker will try to guess it. 

    Please enter a code and the Code breaker will try to guess, an example like this:

    green, green, blue, blue
    "
  end

  def print_feedback_guide
    puts "Now CodeMaker, it's time to give feedback

      - O: Ocurrency with position and color
      - X: Ocurrency color but wrong position
      - : No ocurrency at all

      \nPlease enter how was the guees by the Code breaker like this:

      2 O, 1 X (2 occurrences of the color and position and one occurrence of the color but wrong position) 
      or 
      (Just press entrer if there is not ocurrency at all)
    "
  end

  def feedback_validations(feedback)
    feedback = verify_feedback_format(feedback)
    feedback = feedback_nums_validation(feedback)
    feedback
  end

  def verify_feedback_format(feedback)
    regular_expression = /^(\d\s[OX](,\s\d\s[OX])?)?$/
    until regular_expression.match(feedback)
      puts "\n#{"The Feedback format is not right. Try again".colorize(:red)}"
      feedback = gets.chomp
    end
    feedback
  end

  def feedback_nums_validation(feedback)
    feedback_nums = feedback.split("").select { |v| v.to_i.is_a?(Integer) }
    sum_of_numbers = feedback_nums.reduce { |sum, num| sum.to_i + num.to_i }.to_i
    if sum_of_numbers > 4 
      puts "\n#{"The Feedback sum should not be more than 4. Try again".colorize(:red)}"
      feedback = feedback_nums_validation(gets.chomp)
    end
    return feedback
  end

  def print_feedback(feedback)
    feedback_array = []
    feedback.split(", ").each do |ocurrency|
      ocurrency[0].to_i.times { feedback_array << "🟥" } if ocurrency.include? "X"
      ocurrency[0].to_i.times { feedback_array << "🔲" } if ocurrency.include? "O"
    end
    print feedback_array.join(" ")
  end

  def give_feedback
    print_feedback_guide
    feedback = feedback_validations(gets.chomp)
    print_feedback(feedback)
  end
end



class ComputerCodeMaker < CodeMaker
  def pick_colors

  end
end

HumanCodeMaker.new.give_feedback