require_relative '../lib/game'

describe "Cell" do
  it "should be initialized as dead" do
    cell = Cell.new
    cell.state.should == :dead
  end
end