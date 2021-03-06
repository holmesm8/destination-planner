require 'rails_helper'

RSpec.describe Destination, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :zip }
    it { should validate_presence_of :description }
    it { should validate_presence_of :image_url }
  end
end
