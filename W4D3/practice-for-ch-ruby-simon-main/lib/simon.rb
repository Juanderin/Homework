class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize

    @sequence_length = 1
    @game_over = false 
    @seq = []

  end

  def add_random_color

    color = ['red', 'blue', 'yellow', 'green']

    @seq << color.sample 

  end
  

  # def show_sequence

  #   add_random_color

  #   (0...@sequence_length).each do |i|
  #     puts seq[i]
  #     sleep 1
  #     system('clear')
  #   end 

    

  # end

    def show_sequence
    add_random_color

    system('clear')

    puts "Remember the sequence:"
    seq.each do |color|
      puts color
      sleep 1
      system('clear')
      sleep 0.5
    end
  end



  def play

      until @game_over
        
        take_turn

      end 

        game_over_message
        reset_game


  end

  def take_turn

    if !@game_over

      show_sequence
      input = require_sequence

      if win_round?(input)
      round_success_message
      @sequence_length += 1
      else 
        @game_over = true
      end 

    end

  end

 

  def require_sequence

    # show_sequence

    puts 'repeat the sequence shown'

    input = gets.chomp.split.map(&:to_s)

   return input


  end

  
  def win_round?(input)


    if input == seq 
      @game_over = false 
      return true
    end 

    @game_over = false 
    return false 
   

  end 

  def round_success_message

   puts 'tu eres muy smart'

  end

  def game_over_message

    puts 'disculpa, no cafe for you in the morning :()'

  end

  def reset_game

    @sequence_length = 1

    @game_over = false 

    # @seq = []

  end
end