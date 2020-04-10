class GiphyFacade
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def random
    @data[:data][:images][:fixed_height_still][:url]
  end
end
