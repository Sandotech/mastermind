require_relative 'mastermind'
require_relative 'code_maker'

class CodeBreaker
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
  def try_guess(feddback = nil)
    puts "#{feddback.join(" ")}" if feddback
  end
end

pc = ComputerCodeMaker.new
feddback = pc.give_feedback("green, green, yellow, yellow")
human = ComputerCodeBreaker.new
human.try_guess(feddback)