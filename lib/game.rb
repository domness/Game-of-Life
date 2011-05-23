class Cell
  attr_reader :state
  attr_accessor :neighbours_count

  def initialize
    @state = :alive
  end

  def next_state
    if @neighbours_count == 2
      @state = :alive
    else
      @staet = :dead
    end
  end
end