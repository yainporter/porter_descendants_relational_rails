require "rails_helper"

RSpec.describe Descendent, type: :model do
  describe "associations" do
    it {should has_many (:missions)}
  end

  it "can combine first and last name for a full name" do
    descendent = Descendent.create(first_name: "Rusty", last_name: "Porter")

    expect(descendent.full_name).to eq("Rusty Porter")
  end

  it "can return yes or no for allergies?" do
    descendent = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true)
    descendent_2 = Descendent.create(first_name: "Rusty", last_name: "Porter", allergies: true)

    expect(descendent.allergies?).to eq("No")
    expect(descendent_2.allergies?).to eq("Yes")
  end

  it "can return yes or no for married?" do
    descendent = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true)
    descendent_2 = Descendent.create(first_name: "Rusty", last_name: "Porter")
    expect(descendent.married?).to eq("Yes")
    expect(descendent_2.married?).to eq("No")
  end

  it "can return yes or no for grandchildren?" do
    descendent = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    descendent_2 = Descendent.create(first_name: "Rusty", last_name: "Porter", married: true)

    expect(descendent.grandchildren?).to eq("Yes")
    expect(descendent_2.grandchildren?).to eq("No")
  end
end
