require "rails_helper"

describe AmusementPark, type: :model do
  describe "associations" do
    it { should have_many :rides }
  end
end
