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

  it "corner cells should have neighbours" do
    cell = @grid.cell_at(0, 0)
    cell.neighbours_count.should == 3
    cell = @grid.cell_at(0, COLUMNS - 1)
    cell.neighbours_count.should == 3
    cell = @grid.cell_at(ROWS - 1, COLUMNS - 1)
    cell.neighbours_count.should == 3
    cell = @grid.cell_at(ROWS - 1, 0)
    cell.neighbours_count.should == 3
  end

  after(:each) do
    @grid = nil
  end
end
