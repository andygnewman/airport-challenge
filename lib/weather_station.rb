module WeatherStation

WEATHER = [:sunny] #, :stormy

  def weather
      @weather = WEATHER
  end

  def weather_condition
    weather.sample
  end

  def stormy_weather?
    weather_condition == :stormy
  end

end