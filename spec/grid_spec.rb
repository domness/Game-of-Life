require 'grid'
require 'cell'

ROWS = 5
COLUMNS = 10

describe Grid do
  before(:each) do
    @grid = Grid.new(ROWS, COLUMNS)
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

  after(:each) do
    @grid = nil
  end
end
