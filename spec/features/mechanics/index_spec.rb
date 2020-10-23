require 'rails_helper'

RSpec.describe "When I visit the mechanics index page" do
  before (:each) do
    @mech1 = Mechanic.create!(name: "Sam Mills", experience: 10)
    @mech2 = Mechanic.create!(name: "Kara Smith", experience: 11)
  end
  
  it "I see all mechanics" do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")

    expect(page).to have_content("#{@mech1.name} - #{@mech1.experience} years of experience")
    expect(page).to have_content("#{@mech2.name} - #{@mech2.experience} years of experience")
  end

end
