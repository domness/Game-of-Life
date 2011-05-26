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

  def column_count
    @grid[0].size
  end

  def row_count
    @grid.size
  end

  def evolve
    each_cell do |cell|
      cell.next_state = :dead if cell.state == :alive && cell.alive_neighbours_count < 2
      cell.next_state = :alive if cell.state == :dead && cell.alive_neighbours_count == 3
      cell.next_state = :dead if cell.state == :alive && cell.alive_neighbours_count > 3
    end
    each_cell do |cell|
      cell.iterate
    end
  end

  def each_cell
    @grid.each do |row|
      row.each do |cell|
        yield cell
      end
    end
  end

  def get_row(row)
    string = ""
    @grid[row].each do |cell|
      string << "0" if cell.state == :dead
      string << "1" if cell.state == :alive
    end
    return string
  end
end