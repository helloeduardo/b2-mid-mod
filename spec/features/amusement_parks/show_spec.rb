require 'rails_helper'

RSpec.describe "When I visit the amusement parks show page" do
  before (:each) do
    @ap1 = AmusementPark.create!(name: "Hershey Park", price: "$50.00")
    @ride1 = Ride.create!(name: "Lightning Racer", thrill: 8, amusement_park: @ap1)
    @ride2 = Ride.create!(name: "Storm Runner", thrill: 9, amusement_park: @ap1)
    @ride3 = Ride.create!(name: "The Great Bear", thrill: 10, amusement_park: @ap1)
  end

  it "I see that amusement park's information" do
    visit "/amusement_parks/#{@ap1.id}"

    expect(page).to have_content(@ap1.name)

    expect(page).to have_content("Admissions: #{@ap1.price}")
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
    expect(page).to have_content("Average Thrill Rating of Rides: #{@ap1.average_ride_thrill}/10")
  end
end
