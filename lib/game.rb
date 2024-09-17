require_relative 'mastermind'
require_relative 'code_breaker'
require_relative 'code_maker'

class Game
  TURNS = 12
  
  def initialize(code_maker_class, code_breaker_class)
    @code_maker = code_maker_class.new
    @code_breaker = code_breaker_class.new
    @code = @code_maker.colors
  end

  def play
    TURNS.times do |time|
      Mastermind.show_turn(time + 1)
      code_breaker_guess = @code_breaker.try_guess
      feddback = @code_maker.give_feedback
      if Mastermind.code_match?(code_breaker_guess, @code)
        puts "\n#{"Congratulations! You guessed the correct code in #{time + 1} turns".colorize(:green)}"
        break
      end
      puts "The code was #{@code}".colorize(:red) if time == 11
    end
  end
end

mastermind = Game.new(HumanCodeMaker, ComputerCodeBreaker)
mastermind.play