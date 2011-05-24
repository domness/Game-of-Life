class Cell
  attr_accessor :state
  attr_reader :neighbours
  attr_writer :next_state
  protected :neighbours

  def initialize
    @neighbours = []
    @state = :dead
    @next_state = nil
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
    live = @neighbours.find_all{|cell| cell.state == :alive}
    live.size
  end

  def iterate
    if @next_state != nil
      @state = @next_state
      @next_state = nil
    end
  end
end
