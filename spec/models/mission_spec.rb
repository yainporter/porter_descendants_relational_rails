require "rails_helper"
RSpec.describe Mission, type: :model do
  describe "associations" do
    it {should belong_to (:descendent)}
  end



  it "can return 'Yes' or 'No' for service_mission?" do
    spain = Mission.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)

    expect(spain.service_mission?).to eq ("No")
  end

  # it "can find the foreign key of a Mission" do
  #   rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
  #   italy = Mission.create(descendent_id: rusty.id, mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)

  #   expect(Mission.find_foreign_key(rusty)).to eq italy
  # end
end
