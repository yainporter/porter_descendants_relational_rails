require "rails_helper"

RSpec.describe "Missions Edit Page", type: :feature do
  before(:each) do
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
  end

  describe "When I visit '/missions/:id/edit'"
    it "Will show me a page to edit a Mission's information" do
      visit "/missions/#{@italy.id}/edit"

      expect(page).to have_content("Mission name:")
      expect(page).to have_content("Mission language:")
      expect(page).to have_content("Country:")
      expect(page).to have_content("Number of members baptized:")
      expect(page).to have_content("Service mission?")
    end
end
