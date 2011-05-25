require 'grid'
require 'cell'

describe Grid do
  before(:each) do
    @grid = Grid.new(5,10)
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

  after(:each) do
    @grid = nil
  end
end
