require "rails_helper"

describe Ride, type: :model do
  describe "associations" do
    it { should belong_to :amusement_park }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end
end
