require_relative 'weather_station'
require_relative 'plane_container'

class Airport

  include WeatherStation
  include PlaneContainer

  def initialize
    @capacity = 6
  end

  def capacity
    @capacity
  end

  def full?
    number_planes == @capacity
  end

  def plane_at_airport?(plane)
    planes.include?(plane)
  end

  def check_airport_full
    raise "Plane cannot land: Airport Full" if full? 
  end  

  def check_plane_at_airport(plane)
    raise "Cannot launch: plane not at airport" if !plane_at_airport?(plane)
  end

  def check_weather
    raise "Cannot complete action: Stormy Weather" if stormy_weather?
  end

  def land(plane)
    check_airport_full
    check_weather
    accept(plane)
    plane.land!
  end

  def launch(plane)
    check_plane_at_airport(plane)
    check_weather
    release(plane)
    plane.fly! 
  end
  
end