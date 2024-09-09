require 'colorize'

class Mastermind
  COLORS = ["🟢", "🔴", "🟡", "🔵", "🟣"]

  def initialize
    @random_code = ""
  end

  def pick_random_code
    clone_array = COLORS.dup
    loop = clone_array.size * 3
    loop.times { |counter| clone_array << clone_array[counter] }
    clone_array.sample(4)
  end

end

# Test the Mastermind class
mm = Mastermind.new
puts mm.pick_random_code
