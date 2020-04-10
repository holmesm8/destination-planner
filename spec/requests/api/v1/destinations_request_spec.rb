require 'rails_helper'

describe "Destinations API" do
  before(:each) do
    @destination1 = Destination.create!(
      name: "Seattle",
      zip: Faker::Address.zip,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )

    @destination2 = Destination.create!(
      name: "Chicago",
      zip: Faker::Address.zip,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )
  end
  
  it "can return a list of destinations" do

    get "/api/v1/destinations"
    expect(response).to be_successful

    destinations = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(destinations.count).to eq(2)
  end

  it "can find a specific destination based on id" do

    get "/api/v1/destinations/#{@destination1.id}"
    expect(response).to be_successful

    destination = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(destination[:attributes][:name]).to eq(@destination1.name)
  end

  it "can create a destination" do
    destination_params = { name: "Denver", zip: Faker::Address.zip, description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image }

    post "/api/v1/destinations", params: destination_params

    destination = JSON.parse(response.body, symbolize_names: true)[:data]
    last = Destination.last

    expect(last.name).to eq(destination_params[:name])
  end

  it "can edit a destination" do
    id = @destination2.id
    destination_params = { name: "Denver" }
    previous_name = Destination.last.name

    put "/api/v1/destinations/#{id}", params: destination_params
    updated_destination = Destination.find_by(id: id)

    expect(response).to be_successful
    expect(updated_destination.name).to_not eq(previous_name)
    expect(updated_destination.name).to eq("Denver")
  end

  it "can destroy a destination" do
    expect{ delete "/api/v1/destinations/#{@destination1.id}" }.to change(Destination, :count).by(-1)

    expect(response).to be_successful
    expect{Destination.find(@destination1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
