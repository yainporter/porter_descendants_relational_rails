require "rails_helper"
RSpec.describe Mission, type: :model do
  it "can return 'Yes' or 'No' for service_mission?" do
    spain = Mission.create(id: 1, mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)

    expect(spain.service_mission?).to eq ("No")
  end
end
