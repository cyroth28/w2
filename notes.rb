# Exception
def main

  while true
    puts "please input a number"

    num = gets.to_i

    begin
      sqrt(num)
    recscue ArguemtnError => e
      puts "Couldn't take the square root of #{num}"
      puts "Error was: #{e.message}"
    end
  end
end

# How to raise an error and allow the user to save it.
# While  true. begin. method. rescue. message. repeat.
# Must be wrapped in a begin, rescue, end block.

# Ensure throws an error, but still runs other code. Same begin, rescue,
# message, ensure (code).

#Common ensure:

f = File.open
begin
  f << a_dangerous_operation
ensure
  #must close the file
  f.close
end

#Retry
def prompt_name
  puts "Please input a name:"
  # split name on spaces
  name_parts = gets.chomp.split

  if name_parts.count != 2
    raise "Uh-oh, finnicky parsing!"
  end

  name_parts
end

def echo_name # this method uses an implicit begin block
  fname, lname = prompt_name

  puts "Hello #{fname} of #{lname}"
rescue
  puts "Please only use two names."
  retry
end

#User ArgumentError, or RuntimeError most often.


#In minesweeper, it has a way to run inspect, which is a great way to get info
# about a particular instance variable.

def inspect
  { :pos => pos,
    :bombed => bombed?,
    :flagged => flagged?,
    :explored => explored? }.inspect
end

#creation of a position easily:
# this allows you to...
def [](pos)
  row, col = pos
  @grid[row][col]
end

def render(reveal = false)
  @grid.map do |row|
    row.map do |tile|
      reveal ? tile.reveal : tile.render
    end.join('')
  end.join("\n")
end

#define neighbors
  def neighbors
    adjacent_coords = DELTAS.map do |(dx, dy)|
      [pos[0] + dx, pos[1] + dy]
    end.select do |row, col| #chain the select at the end of end
      [row, col].all? do |coord|
        coord.between?(0, @board.grid_size - 1)
      end
    end

    adjacent_coords.map { |pos| @board[pos] }  # maps the position to the tiles
  end                                          # at those locations


  def won?
    @grid.flatten.none? { |tile| tile.bombed? != tile.flagged? }
  end

# @grid.flatten creates a simple array that has only 1 level, so that you can
# map or iterate over the whole thing at once.

def generate_board
  @grid = Array.new(@grid_size) do |row|
    Array.new(@grid_size) { |col| Tile.new(self, [row, col]) }
  end

  plant_bombs #plant bombs changes the attribute of the tile
end
# each creates a new tile within the board class itself.

end*' '
end*'\n'
# allows you to join array elements. Fucking cool.


def plant_bombs
  total_bombs = 0
  while total_bombs < @num_bombs
    rand_pos = Array.new(2) { rand(@grid_size) }

    tile = self[rand_pos]
    next if tile.bombed?

    tile.plant_bomb
    total_bombs += 1
  end

  nil
end
end

# this logic allows someone to randomly pick a position, then calls the
# bombed? method on tile to change the tile object's attribute to "bombed"
#
def initialize(size)
  layout = LAYOUTS[size]
  @board = Board.new(layout[:grid_size], layout[:num_bombs])
end

# create Board.new as an object of the game class.
def play
  until @board.won? || @board.lost?
    puts @board.render

    action, pos = get_move  # you can not pass in a variable but instead call get_move and set it equal to those parameters
    perform_move(action, pos)
  end

  if @board.won?
    puts "You win!"
  elsif @board.lost?
    puts "**Bomb hit!**"
    puts @board.reveal
  end

  # action, pos = get_move
  # perform_move(action_type, pos)






#
