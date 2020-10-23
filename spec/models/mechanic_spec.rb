require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'instance methods' do
    before (:each) do
      @ap1 = AmusementPark.create!(name: "Hershey Park", price: "$50.00")
      @ride1 = Ride.create!(name: "The Frog Hopper", thrill: 8, amusement_park: @ap1)
      @ride2 = Ride.create!(name: "Fahrenheit", thrill: 9, amusement_park: @ap1)

      @ap2 = AmusementPark.create!(name: "Disney Park", price: "$100.00")
      @ride3 = Ride.create!(name: "The Kiss Raise", thrill: 10, amusement_park: @ap2)

      @mech = Mechanic.create!(name: "Kara Smith", experience: 11)
      @mech.rides << @ride1
      @mech.rides << @ride2
      @mech.rides << @ride3
    end

    it ".alphabetical_rides" do
      expect(@mech.alphabetical_rides).to eq([@ride2,  @ride1, @ride3])
    end
  end
end
