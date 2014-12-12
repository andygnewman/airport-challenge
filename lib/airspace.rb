class Airspace

  def initialize
    @planes = []
  end

  def planes
    @planes
  end

  def accept(plane)
    planes << plane
  end

  def release(plane)
    planes.delete(plane)
  end

  def number_planes?
    planes.length
  end


end