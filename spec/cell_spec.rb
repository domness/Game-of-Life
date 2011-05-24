require_relative '../lib/cell'

describe "Cell" do
  it "should be initialized as dead" do
    cell = Cell.new
    cell.state.should == :dead
  end

  it "live cell should die from under-population" do
    cell = Cell.new
    cell.state = :alive
    cell.neighbours_count = 1
    cell.next_state.should == :dead
  end

  it "live cell should live with 2 neighbours" do
    cell = Cell.new
    cell.state = :alive
    cell.neighbours_count = 2
    cell.next_state.should == :alive
  end

  it "live cell should live with 3 neighbours" do
    cell = Cell.new
    cell.state = :alive
    cell.neighbours_count = 3
    cell.next_state.should == :alive
  end

  it "live cell with more than 3 live neighbours dies" do
    cell = Cell.new
    cell.state = :alive
    cell.neighbours_count = 4
    cell.next_state.should == :dead
  end
  
  it "dead cell with exactly 3 live neighbours should be born" do
    cell = Cell.new
    cell.neighbours_count = 3
    cell.next_state.should == :alive
  end
end
