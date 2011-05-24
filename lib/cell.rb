class Cell
  attr_accessor :state
  attr_accessor :neighbours_count
  attr_reader :neighbours
  attr_writer :next_state
  protected :neighbours

  def initialize
    @neighbours = []
    @state = :dead
  end

  def add_neighbour(cell)
    unless @neighbours.include? cell
      @neighbours << cell
      cell.neighbours << self
    end
  end

  def neighbours_count
    @neighbours.size
  end

  def alive_neighbours_count
    live_neighbours = []
    @neighbours.each do |live|
      if (live.state == :alive)
        live_neighbours << live
      end
    end
    live_neighbours.size
  end

  def iterate
    if @next_state != nil
      @state = @next_state
      @next_state = nil
    end
  end
end
