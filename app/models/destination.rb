class Destination < ApplicationRecord
  validates_presence_of :name, :zip, :description, :image_url
end
