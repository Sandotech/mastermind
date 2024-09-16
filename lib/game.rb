class Game
  TURNS = 12
  
  def initialize(code_maker_class, code_breaker_class)
    @code_maker_class = code_maker_class.new
    @code_breaker_class = code_breaker_class.new
  end
end