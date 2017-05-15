class MasterMind

  attr_accessor :code, :mode, :state, :hint
  
  def initialize
    @guesses = []
    @clues = []
    @hint = [[0,0,0,0],[]]
    @turn = 0
    @state = 0
  end
  
  def generate_code
    if @mode == 1
      @code = ''
      4.times { @code += rand(1..6).to_s }
    else
      puts "Enter a four digit code, using 1 - 6: "
      @code = gets.chomp
    end
  end
  
  def start
    system "clear"
    puts "~~MasterMind~~"
    puts "Game Mode - 1) Break | 2) Make: "
    while @mode = gets.chomp.to_i
      break if @mode == 1 || @mode == 2
    end
    system "clear"
    generate_code
    @state = 1
  end
  
  def draw
    system "clear"
    @guesses.each_with_index { |x, i| puts "#{x}  |  #{@clues[i]}"}
  end
  
  def turn(guess)
    draw
    return false if !validate_guess(guess)
    @guesses.push(guess)
    if @guesses.last != @code && @turn < 13
      generate_clues
      draw
      @turn += 1
    elsif @turn == 13
      puts "Game Over - Code: #{@code}"
      @state = 0
    elsif @guesses.last == @code
      puts "Success - Code Broken!"
      @state = 0
    end
  end
  
  def validate_guess(guess)
    return true if (guess =~ /^[1-6]{4}$/)
  end
  
  def generate_clues
    @clues[@turn] = ''
    temp_guess = @guesses[@turn].dup
    temp_code = @code.dup
    checked = [0,1,2,3]
    @hint = [[0,0,0,0],[]]  #for robots
    
    (0..3).each do |x|  #Check position/number matches
      if temp_guess[x] == @code[x]
        @clues[@turn] += 'X' 
        checked.delete(x)
        @hint[0][x] = temp_guess[x]
        temp_code.sub!(temp_guess[x], '')
      end
    end
    
    checked.each do |x| #Check number matches
      if temp_code.include? temp_guess[x]
        @clues[@turn] += 'O' 
        hint[1].push(temp_guess[x])
        temp_code.sub!(temp_guess[x], '')
      end
    end
    
  end
  
end
