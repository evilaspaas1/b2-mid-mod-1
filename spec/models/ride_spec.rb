require "rails_helper"

describe Ride, type: :model do
  describe "associations" do
    it { should belong_to :amusement_park }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe "class methods" do
    it ".average_thrill_rating" do
      six_flags = AmusementPark.create!(name: "Six Flags Great America", price: 45)
      american_eagle = six_flags.rides.create!(name: "American Eagle", thrill_rating: 7)
      raging_bull = six_flags.rides.create!(name: "Raging Bull", thrill_rating: 9)
      giant_drop = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 10)

      expect(six_flags.rides.average_thrill_rating.round(1)).to eq(8.7)
    end
  end
end
