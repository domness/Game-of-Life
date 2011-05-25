require_relative 'cell'

class Grid
  def initialize(rows, columns)
    @grid = Array.new(rows)
    for row in 0...rows
      @grid[row] = Array.new(columns)
      for column in 0...columns
        cell = Cell.new
        @grid[row][column] = cell
        if row > 0
          cell.add_neighbour @grid[row-1][column]
          cell.add_neighbour @grid[row-1][column+1] if column <= columns - 2
        end
        if column > 0
          cell.add_neighbour @grid[row][column-1]
          cell.add_neighbour @grid[row-1][column-1] if row > 0
        end
      end
    end
  end

  def cell_at(row, column)
    @grid[row][column]
  end

  def column_count()
    @grid[0].size
  end

  def row_count()
    @grid.size
  end
end