require 'game'

ROWS = 5
COLUMNS = 10

describe Game do
  before(:each) do
    @game = Game.new(ROWS, COLUMNS)
  end

  it "should be initialized with rows and columns" do
    grid = @game.grid
    grid.row_count.should == 5
    grid.column_count.should == 10
  end

  it "should be able to set alive cells" do
    alive_cells = [{:row => 1, :column => 1}, {:row => 2, :column => 1}]
    @game.set_alive_cells(alive_cells)
    grid = @game.grid
    grid.cell_at(0, 1).state.should == :dead
    grid.cell_at(1, 1).state.should == :alive
    grid.cell_at(2, 1).state.should == :alive
  end

  after(:each) do
    @game = nil
  end
end