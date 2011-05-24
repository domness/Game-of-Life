require_relative '../lib/cell'

describe "Cell" do
  it "should be initialized as dead" do
    cell = Cell.new
    cell.state.should == :dead
  end

  it "should have neighbours" do
    cell1 = Cell.new
    cell2 = Cell.new

    cell1.neighbours_count.should == 0
    cell2.neighbours_count.should == 0

    cell1.add_neighbour(cell2)

    cell1.neighbours_count.should == 1
    cell2.neighbours_count.should == 1
  end

  it "should only have a certain cell as a neighbour once" do
    cell1 = Cell.new
    cell2 = Cell.new

    cell1.neighbours_count.should == 0
    cell2.neighbours_count.should == 0

    cell1.add_neighbour(cell2)
    cell1.add_neighbour(cell2)

    cell1.neighbours_count.should == 1
    cell2.neighbours_count.should == 1
  end

  it "should have alive neighbours" do
    cell1 = Cell.new
    cell2 = Cell.new
    cell3 = Cell.new

    cell1.add_neighbour(cell2)
    cell1.alive_neighbours_count.should == 0
    cell2.state = :alive
    cell1.alive_neighbours_count.should == 1
    cell3.state = :alive
    cell1.add_neighbour(cell3)
    cell1.alive_neighbours_count.should == 2
  end

  it "should assess its state for its next iteration" do
    cell1 = Cell.new
    cell1.state.should == :dead

    cell1.state = :alive
    cell1.state.should == :alive

    cell1.next_state = :dead
    cell1.state.should == :alive

    cell1.iterate
    cell1.state.should == :dead

    cell1.next_state = :alive
    cell1.state.should == :dead

    cell1.iterate
    cell1.state.should == :alive

    cell1.iterate
    cell1.state.should == :alive

    cell1.state = :dead
    cell1.state.should == :dead

    cell1.iterate
    cell1.state.should == :dead
  end
end
