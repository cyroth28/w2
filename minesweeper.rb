require "byebug"

class Board
  attr_accessor :board, :tile_grid

  def initialize
    @tile_grid = Array.new(9) {Array.new(9) }
    tile_creation
    set_tile_value
    display
  end

  def tile_creation
    9.times do |y|
      9.times do |x|
        @tile_grid[x][y] = Tile.new([x,y], self)
      end
    end
    self
  end

  def set_tile_value
    bomb_count = 0
    until bomb_count == 10
      x = rand(9)
      y = rand(9)
      # byebug
      unless @tile_grid[x][y].value == :b
        @tile_grid[x][y].value = :b
        bomb_count += 1
      end
    end
    self
  end

  def tile(x, y)
    @tile_grid[x][y]
  end

  def display_board
    display_column = []
    9.times do |y|
      display_row = []
      9.times do |x|
        display_row << tile(x,y).display
      end
      display_column << display_row.join('  ')
    end
  display_column.map { | row | puts row }
  end



end

class Game
  def initialize
    @board = Board.new
    play
  end

  def play
    puts "You're playing minesweeper!"
     while true
      p @board.display_board
      puts "Pick a x coordinate"
      x = gets.chomp.to_i
      puts "Pick a y coordinate"
      y = gets.chomp.to_i
      @board.tile(x,y).reveal
    end
  end

  # def won?
  #   won = false
  #   until .tile.display.all? !=

end

class Tile
  attr_accessor :coords, :board, :value, :display, :revealed

  def initialize(coords, board, value = :n, display = "_", revealed = false)
    @coords = coords
    @board = board
    @value = value
    @display = display
    @revealed = revealed
  end

  def reveal
    @value
  end
# how do you make calling other instances of the class easy? Can you reference it by coordinates?

  def know_neighbors
    bomb_neighbors = 0
    neighbor_coords = []
    rel_neighbor_coords = [[0, 1], [1, 1], [-1, 0], [-1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]
    rel_neighbor_coords.each do | coord |
      neighbor_coords << [@coords[0] + coord[0], @coords[1] + coord[1]]
    end
    neighbor_coords.select! {|pos| pos.all? { |coord| (0..8).cover? coord }}
    neighbor_coords
  end

  def check_neighbors
    know_neighbors.map do |neighbor|
      @board.tile(neighbor[0], neighbor[1])
    end
  end

  def count_bombs
    count = 0
    check_neighbors.each do | neighbor |
      unless self.value == :b
        if neighbor.value == :b
          count += 1
        end
      end
   end

   count
  end

# needs to
  def reveal
    return if self.revealed == true
    self.revealed = true

    if self.value == :b
      puts "You lose"
      exit
    else
      if count_bombs > 0
        self.display = count_bombs.to_s
        return true
      else
        self.display = '  '
        check_neighbors.each do |neighbor|

          neighbor.reveal unless neighbor.value == :b
        end
      end
    end
  end

end

# Board.new
# Board.new.tile_creation
#Board.new.tile_creation.set_tile_value

# a = Board.new
Game.new
# z = a.tile(0,0)
# z.check_neighbors
# p z.reveal

# p z.check_neighbors


#   def initialize_board

# end
