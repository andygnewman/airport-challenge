require_relative 'weather_station'

class Airport

  include WeatherStation

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
    planes << plane
  end

  def full?
    number_planes == @capacity
  end

  def airport_full_check
    raise "Plane cannot land: Airport Full" if full? 
  end  

  def land(plane, airspace)
    airport_full_check
    accept(plane)
    airspace.release(plane)
    plane.land!
  end

  def land_with_weather_check(plane, airspace)
    weather_check
    land(plane, airspace)
  end

  def weather_check
    raise "Cannot complete action: Stormy Weather" if stormy_weather?
  end

  def release(plane)
    planes.delete(plane)
  end

  def launch(plane, airspace)
    airspace.accept(plane)
    release(plane)
    plane.fly! 
  end
  
  def launch_with_weather_check(plane, airspace)
    weather_check
    launch(plane, airspace)
  end

end