class Airport

  def initialize
    @planes = []
    @capacity = 5
  end

  def planes
    @planes
  end

  def capacity
    @capacity
  end

  def number_planes
    planes.length
  end

  def accept(plane)
    raise "Plane cannot land: Airport Full" if full?
    planes << plane
  end

  def release(plane)
    planes.delete(plane)
  end

  def full?
    number_planes == @capacity
  end

end