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
    raise "Plane cannot land: Airport Full" if full?
    planes << plane
  end

  def release(plane)
    raise "Plane cannot take off: Stormy Weather" if stormy_weather?
    planes.delete(plane)
  end

  def full?
    number_planes == @capacity
  end

end