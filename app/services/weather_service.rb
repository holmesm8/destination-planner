class WeatherService
  attr_reader :city

  def initialize(city)
    @city = get_json("weather?q=#{city}&appid=#{ENV['WEATHER_API_KEY']}")
  end

  private
    def conn
      Faraday.new(url: 'https://api.openweathermap.org/data/2.5')
    end

    def get_json(url)
      response = conn.get(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end
end
