class Board
  attr_accessor :cups

  def initialize(name1, name2)

    @player1 = name1

    @player2 = name2

    @cups = Array.new(14) {Array.new(4, :stone)}

    @cups[13].clear 
    @cups[6].clear

  end

  def [](pos)

    row, col = pos 

    @cups[row][col]

  end 

  def []=(pos, val)

    row, col = pos 

    @cups[row][col] = val

  end 

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_cup)

    unless start_cup.between?(0, 13)
      raise "Invalid starting cup"
    end

    unless cups[start_cup].any?
      raise "Starting cup is empty"
    end

    true

  end


  def make_move(start_cup, current_player_name)

    stones = cups[start_cup]

    cups[start_cup] = []

    cup_idx = start_cup

    until stones.empty?
      cup_idx = (cup_idx + 1) % 14
      next if (current_player_name == @player2 && cup_idx == 13) || (current_player_name == @player1 && cup_idx == 6)
      cups[cup_idx] << stones.pop
    end

  end 
  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} #{[store2]} -------------------------- #{[store1]} #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end