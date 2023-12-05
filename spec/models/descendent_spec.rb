require "rails_helper"

RSpec.describe Descendent, type: :model do
  before(:each) do
    @descendent = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @descendent_2 = Descendent.create(first_name: "Rusty", last_name: "Porter", allergies: true)
    @italy = @descendent_2.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, foreign_mission: false)
  end

  describe "associations" do
    it {should have_many (:missions)}
  end

  it "can combine first and last name for a full name" do

    expect(@descendent_2.full_name).to eq("Rusty Porter")
  end

  it "can return yes or no for allergies?" do

    expect(@descendent.allergies?).to eq("No")
    expect(@descendent_2.allergies?).to eq("Yes")
  end

  it "can return yes or no for married?" do
    expect(@descendent.married?).to eq("Yes")
    expect(@descendent_2.married?).to eq("No")
  end

  it "can return yes or no for grandchildren?" do

    expect(@descendent.grandchildren?).to eq("Yes")
    expect(@descendent_2.grandchildren?).to eq("No")
  end

  it "can count the number of missions that belong to a Descendent" do
    expect(@descendent.missions_served).to eq 0
    expect(@descendent_2.missions_served).to eq 1
  end

  it "can sort Descendents by the number of their missions" do
    @descendent.missions.create(mission_name: "Tokyo")
    @descendent.missions.create(mission_name: "Hawaii")
    @descendent.missions.create(mission_name: "Gilbert")
    @amy = Descendent.create(first_name: "Amy", last_name: "Porter", married: true, grandchildren: true)
    @amy.missions.create(mission_name: "Kentucky")
    @amy.missions.create(mission_name: "Arizona")

    descendents_sorted_by_mission_count = Descendent.sort_by_number_of_missions
    first = descendents_sorted_by_mission_count.shift
    second = descendents_sorted_by_mission_count.shift
    third = descendents_sorted_by_mission_count.shift
    expect([first, second, third]).to eq([@descendent, @amy, @descendent_2])
  end
end
