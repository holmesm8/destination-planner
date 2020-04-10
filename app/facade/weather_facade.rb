require './app/models/destination'

class WeatherFacade
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def current_temp
    temp = @data[:main][:temp]
    kelvin_to_f(temp)
  end

  def high_temp
    temp = @data[:main][:temp_max]
    kelvin_to_f(temp)
  end

  def low_temp
    temp = @data[:main][:temp_min]
    kelvin_to_f(temp)
  end

  def summary
    @data[:weather][0][:description]
  end

  def kelvin_to_f(temp)
    ((temp - 273.15) * 9/5 + 32).round(2)
  end
end
