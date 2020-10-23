require "rails_helper"

describe "as a visitor" do
  describe "when I visit a mechanics index page" do
    it "I see a list of all mechanics and their info" do
      van = Mechanic.create!(name: "Van Stone-arm", experience: 7)
      old_greg = Mechanic.create!(name: "Greg", experience: 35)

      visit "/mechanics"

      expect(page).to have_content("#{van.name} - #{van.experience} years of experience")
      expect(page).to have_content("#{old_greg.name} - #{old_greg.experience} years of experience")
    end
  end
end
