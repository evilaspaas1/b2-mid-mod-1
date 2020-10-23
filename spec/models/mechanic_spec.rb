require "rails_helper"

describe Mechanic, type: :model do
  describe "associations" do
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "instance methods" do
    it ".workload" do
      van = Mechanic.create!(name: "Van Stone-arm", experience: 7)

      six_flags = AmusementPark.create!(name: "Six Flags Great America", price: 45)

      american_eagle = six_flags.rides.create!(name: "American Eagle", thrill_rating: 7)
      raging_bull = six_flags.rides.create!(name: "Raging Bull", thrill_rating: 9)
      giant_drop = six_flags.rides.create!(name: "Giant Drop", thrill_rating: 10)

      RideMechanic.create!(mechanic_id: van.id, ride_id: american_eagle.id)
      RideMechanic.create!(mechanic_id: van.id, ride_id: raging_bull.id)
      RideMechanic.create!(mechanic_id: van.id, ride_id: giant_drop.id)

      expect(van.workload).to eq(["American Eagle", "Raging Bull", "Giant Drop"])
    end
  end
end
