require_relative '../lib/game'

describe "Cell" do
  it "should be initialized as dead" do
    cell = Cell.new
    cell.state.should == :alive
  end

  it "live cell should die from under-population" do
    cell = Cell.new
    cell.neighbours_count = 1
    cell.next_state.should == :dead
  end

  it "live cell should live with 2 neighbours" do
    cell = Cell.new
    cell.neighbours_count = 2
    cell.next_state.should == :alive
  end
end