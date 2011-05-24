class Cell
  attr_accessor :state
  attr_accessor :neighbours_count
  attr_reader :neighbours
  protected :neighbours

  def initialize
    @neighbours = []
    @state = :dead
  end

  def next_state
    if @neighbours_count == 2
      @state = :alive
    elsif @neighbours_count == 3
      @state = :alive
    else
      @state = :dead
    end
  end
end
