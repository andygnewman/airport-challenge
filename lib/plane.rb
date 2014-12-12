class Plane

  def initialize
    fly!
  end

  def fly!
    @flying = true
  end

  def flying?
    @flying
  end

  def land!
    @flying = false
  end  


end