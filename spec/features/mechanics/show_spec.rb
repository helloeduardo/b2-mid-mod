require 'rails_helper'

RSpec.describe "When I visit the mechanics show page" do
  before (:each) do
    @ap1 = AmusementPark.create!(name: "Hershey Park", price: "$50.00")
    @ride1 = Ride.create!(name: "The Frog Hopper", thrill: 8, amusement_park: @ap1)
    @ride2 = Ride.create!(name: "Fahrenheit", thrill: 9, amusement_park: @ap1)

    @ap2 = AmusementPark.create!(name: "Disney Park", price: "$100.00")
    @ride3 = Ride.create!(name: "The Kiss Raise", thrill: 10, amusement_park: @ap2)

    @mech = Mechanic.create!(name: "Kara Smith", experience: 11)
    @mech.rides << @ride1
    @mech.rides << @ride2
  end

  it "I see that mechanic's information" do
    visit "/mechanics/#{@mech.id}"

    expect(page).to have_content("Mechanic: Kara Smith")
    expect(page).to have_content("Years of Experience: 11")

    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to_not have_content(@ride3.name)

    expect(page).to have_content("Add a ride to workload:")

    fill_in :ride, with: @ride3.name

    click_on 'Submit'

    expect(current_path).to eq("/mechanics/#{@mech.id}")

    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
    expect(page).to have_content(@ride3.name)
  end

  it "I see that mechanic's rides in alphabetical order" do
    @mech.rides << @ride3

    visit "/mechanics/#{@mech.id}"

    expect(page.all('.ride')[0]).to have_content(@ride2.name)
    expect(page.all('.ride')[1]).to have_content(@ride1.name)
    expect(page.all('.ride')[2]).to have_content(@ride3.name)
  end
end
