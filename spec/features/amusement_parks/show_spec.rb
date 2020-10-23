require "rails_helper"

describe "As a visitor" do
  describe "When I visit an amusement park’s show page" do
    it "I see the name and price of admissions for that amusement park" do
      six_flags = AmusementPark.create!(name: "Six Flags Great America", price: 45)
      american_eagle = six_flags.rides.create!(name: "American Eagle", thrill_rating: 7)
      raging_bull = six_flags.rides.create!(name: "Raging Bull", thrill_rating: 9)
      giant_drop = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 10)

      visit "/amusement_parks/#{six_flags.id}"

      expect(page).to have_content(six_flags.name)
      expect(page).to have_content("Admissions: $#{six_flags.price}.00")
      expect(page).to have_content("1. #{american_eagle.name}")
      expect(page).to have_content("2. #{raging_bull.name}")
      expect(page).to have_content("3. #{giant_drop.name}")
      expect(page).to have_content("Average Thrill Rating of Rides: #{six_flags.rides.average_thrill_rating.round(1)}/10")
    end
  end
end
