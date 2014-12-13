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
    accept(plane)
    airspace.release(plane)
    plane.land!
  end

  def land_with_weather_check(plane, airspace)
    weather_check
    land(plane, airspace)
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