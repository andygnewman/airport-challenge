require_relative 'weather_station'
require_relative 'plane_container'

class Airport

  include WeatherStation
  include PlaneContainer

    def initialize
      @capacity = 5
    end

  def capacity
    @capacity
  end

  def full?
    number_planes == @capacity
  end

  def airport_full_check
    raise "Plane cannot land: Airport Full" if full? 
  end  

  def weather_check
    raise "Cannot complete action: Stormy Weather" if stormy_weather?
  end

  def land(plane, airspace)
    airport_full_check
    weather_check
    accept(plane)
    airspace.release(plane)
    plane.land!
  end

  def launch(plane, airspace)
    weather_check
    airspace.accept(plane)
    release(plane)
    plane.fly! 
  end
  
end