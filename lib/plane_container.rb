module PlaneContainer

  def planes
      @planes ||= []
  end

  def number_planes
    planes.length
  end

  def accept(plane)
    planes << plane
  end

  def release(plane)
    planes.delete(plane)
  end

end