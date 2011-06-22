require 'grid'
require 'cell'

describe Grid do
  before(:each) do
    @grid = Grid.new(5, 10)
  end

  it "should contain a grid of cells" do
    cell = @grid.cell_at(0, 0)
    cell.should_not == nil
    cell.state.should == :dead
  end

  it "should have a row count" do
    @grid.row_count.should == 5
  end

  it "should have a column count" do
    @grid.column_count.should == 10
  end

  it "should have 3 neighbours for corner cells" do
    cell = @grid.cell_at(0, 0)
    cell.neighbours_count.should == 3

    cell = @grid.cell_at(0, COLUMNS - 1)
    cell.neighbours_count.should == 3

    cell = @grid.cell_at(ROWS - 1, COLUMNS - 1)
    cell.neighbours_count.should == 3

    cell = @grid.cell_at(ROWS - 1, 0)
    cell.neighbours_count.should == 3
  end

  it "should have 5 neighbours in the first and last row except the corners" do
    for column in 1...COLUMNS-1
      cell = @grid.cell_at(0, column)
      cell.neighbours_count.should == 5

      cell = @grid.cell_at(ROWS - 1, column)
      cell.neighbours_count.should == 5
    end
  end

  it "should have 5 neighbours in the first and last column except the corners" do
    for row in 1...ROWS-1
      cell = @grid.cell_at(row, 0)
      cell.neighbours_count.should == 5

      cell = @grid.cell_at(row, COLUMNS - 1)
      cell.neighbours_count.should == 5
    end
  end

  it "should have 8 neighbours when not along the edges" do
    for row in 1...ROWS-1
      for column in 1...COLUMNS-1
        cell = @grid.cell_at(row, column)
        cell.neighbours_count.should == 8
      end
    end
  end

  it "should have cells that die when they are under-populated" do
    cell = @grid.cell_at(3, 3)
    cell.state.should == :dead

    cell.state = :alive
    @grid.evolve
    cell.state.should == :dead
  end

  it "should have cells that are reborn" do
    cell1 = @grid.cell_at(0, 0)
    cell1.state = :alive
    cell2 = @grid.cell_at(1, 0)
    cell2.state = :alive
    cell3 = @grid.cell_at(2, 0)
    cell3.state = :alive

    test_cell = @grid.cell_at(1, 1)

    test_cell.state = :dead
    @grid.evolve
    test_cell.state.should == :alive
  end

  it "should have cells that are overcrowded" do
    cell1 = @grid.cell_at(0, 0)
    cell1.state = :alive
    cell2 = @grid.cell_at(1, 0)
    cell2.state = :alive
    cell3 = @grid.cell_at(2, 0)
    cell3.state = :alive
    cell4 = @grid.cell_at(0, 1)
    cell4.state = :alive
    test_cell = @grid.cell_at(1, 1)
    test_cell.state = :alive

    @grid.evolve

    test_cell.state.should == :dead
  end

  it "should be able to print to it's rows" do
    row = @grid.get_row(1)
    row.should == "OOOOOOOOOO"

    cell = @grid.cell_at(1, 2)
    cell.state = :alive
    row = @grid.get_row(1)
    row.should == "OO1OOOOOOO"

    cell = @grid.cell_at(1, 3)
    cell.state = :alive
    row = @grid.get_row(1)
    row.should == "OO11OOOOOO"
  end

  after(:each) do
    @grid = nil
  end
end
