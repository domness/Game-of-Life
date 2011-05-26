require_relative 'cell'
require_relative 'grid'

class Game
  attr_accessor :grid

  def initialize(rows, columns)
    @grid = Grid.new(rows, columns)
  end

  def set_alive_cells(alive_cells)
    alive_cells.each do |new_birth|
      cell = @grid.cell_at(new_birth[:row], new_birth[:column])
      cell.state = :alive
    end
  end

  def play_game(iterations, timer_seconds)
    i = 0
    begin
      i += 1
      print "\e[2J\e[f"
      @grid.print_grid
      @grid.evolve
      sleep timer_seconds
    end until i == iterations
  end
end

if $0 == __FILE__ then
  game = Game.new(5, 10)
  alive_cells = [{:row => 1, :column => 3},
    {:row => 1, :column => 4},
    {:row => 1, :column => 5},
    {:row => 2, :column => 3},
    {:row => 2, :column => 4},
    {:row => 2, :column => 5},
    {:row => 3, :column => 3},
    {:row => 3, :column => 4},
    {:row => 3, :column => 5}]
  game.set_alive_cells(alive_cells)
  game.play_game(50, 0.2)
end
