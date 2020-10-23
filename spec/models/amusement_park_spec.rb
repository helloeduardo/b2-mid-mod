require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'instance methods' do
    before (:each) do
      @ap1 = AmusementPark.create!(name: "Hershey Park", price: "$50.00")
      @ride1 = Ride.create!(name: "Lightning Racer", thrill: 8, amusement_park: @ap1)
      @ride2 = Ride.create!(name: "Storm Runner", thrill: 9, amusement_park: @ap1)
      @ride3 = Ride.create!(name: "The Great Bear", thrill: 10, amusement_park: @ap1)
    end

    it '.average_ride_thrill' do
      expect(@ap1.average_ride_thrill).to eq(9)
    end
  end
end
