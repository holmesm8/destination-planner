require 'rails_helper'

RSpec.describe 'destination show page' do
  it 'shows information on a specific destination' do
    @destination1 = Destination.create!(
      name: "Seattle",
      zip: Faker::Address.zip,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )

    visit '/'

    within(".row") do
      click_link "Show"
    end

    expect(current_path).to eq("/destinations/#{@destination1.id}")
    expect(page).to have_content("Date: ")
    expect(page).to have_content("Current Temp: ")
    expect(page).to have_content("High Temp: ")
    expect(page).to have_content("Low Temp: ")
    expect(page).to have_content("Summary: ")
  end

  it 'shows an image of the city' do
    @destination1 = Destination.create!(
      name: "Seattle",
      zip: Faker::Address.zip,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )

    visit '/'

    within(".row") do
      click_link "Show"
    end
    expect(page).to have_css("img[src*='giphy']")
  end
end
