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

  after(:each) do
    @grid = nil
  end
end
