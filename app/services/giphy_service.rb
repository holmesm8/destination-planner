class GiphyService
  attr_reader :gif

  def initialize(weather)
    @gif = get_json("random?api_key=#{ENV['GIPHY_API_KEY']}&tag=#{weather}")
  end

  private
    def conn
      Faraday.new(url: 'https://api.giphy.com/v1/gifs/')
    end

    def get_json(url)
      response = conn.get(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end
end
