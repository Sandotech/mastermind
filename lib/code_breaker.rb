require_relative 'mastermind'
require_relative 'code_maker'

class CodeBreaker
  COLORS = ["🟢", "🔴", "🟡", "🔵", "🟣"]

  def initialize
    @table = Array.new(12) { Array.new }
    @turn = 0
  end
end

class HumanCodeBreaker < CodeBreaker
  def try_guess
    Mastermind.try_guess
  end
end

class ComputerCodeBreaker < CodeBreaker
  def first_turn
    random_one = Random.rand(0..4)
    random_two = Random.rand(0..4)
    @table << COLORS[random_one] + COLORS[random_one] + COLORS[random_two] + COLORS[random_two]
    puts "#{COLORS[random_one] + COLORS[random_one] + COLORS[random_two] + COLORS[random_two]}"
    return COLORS[random_one] + COLORS[random_one] + COLORS[random_two] + COLORS[random_two]
  end
  def try_guess(feddback = nil)
    first_turn

    # logic to guess the code
    #...

  end
end

# pc = ComputerCodeMaker.new
# feddback = pc.give_feedback("green, green, yellow, yellow")
# computer = ComputerCodeBreaker.new
# computer.try_guess(feddback)