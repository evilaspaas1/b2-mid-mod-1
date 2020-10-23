require "rails_helper"

describe "as a user" do
  describe "When I go to a mechanics show page" do
    before :each do
      @van = Mechanic.create!(name: "Van Stone-arm", experience: 7)

      @six_flags = AmusementPark.create!(name: "Six Flags Great America", price: 45)

      @american_eagle = @six_flags.rides.create!(name: "American Eagle", thrill_rating: 7)
      @raging_bull = @six_flags.rides.create!(name: "Raging Bull", thrill_rating: 9)
      @giant_drop = @six_flags.rides.create!(name: "Giant Drop", thrill_rating: 10)
      @v2 = @six_flags.rides.create!(name: "V2", thrill_rating: 7)

      RideMechanic.create!(mechanic_id: @van.id, ride_id: @american_eagle.id)
      RideMechanic.create!(mechanic_id: @van.id, ride_id: @raging_bull.id)
      RideMechanic.create!(mechanic_id: @van.id, ride_id: @giant_drop.id)

      visit "/mechanics/#{@van.id}"
    end

    it "I see their name, years of experience, and names of all rides they’re working on" do
      expect(page).to have_content("Mechanic: #{@van.name}")
      expect(page).to have_content("Years of Experience: #{@van.experience}")

      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content("#{@american_eagle.name}")
      expect(page).to have_content("#{@raging_bull.name}")
      expect(page).to have_content("#{@giant_drop.name}")
    end

    it "And I also see a form to add a ride to their workload" do
      fill_in :ride_id, with: @v2.id
      click_button "Submit"

      expect(current_path).to eq("/mechanics/#{@van.id}")
      expect(page).to have_content("V2")
    end
  end
end
