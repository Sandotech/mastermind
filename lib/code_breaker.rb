require_relative 'mastermind'

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

human = HumanCodeBreaker.new
human.try_guess