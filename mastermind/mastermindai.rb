class MasterMindAI
  def initialize
    @guesses = []
  end
  
  def guess(hint=[])
    hint[0] = [0,0,0,0] if hint[0].empty?
    hint[1] = [] if hint.size == 1
    temp_guess = ''
    until !@guesses.include? temp_guess
      hint[0].each do |x|
        if x == 0
          if !hint[1].empty?
            guess_index = rand(0..hint[1].size-1)
            temp_guess += hint[1][guess_index]
            hint[1].delete(guess_index)
          else
            temp_guess += rand(1..6).to_s
          end
        else
          temp_guess += x
        end
      end
    end
    @guesses.push(temp_guess)
    temp_guess
  end
end

