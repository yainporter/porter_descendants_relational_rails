require "rails_helper"

RSpec.describe "Missions Edit Page", type: :feature do
  before(:each) do
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, foreign_mission: false)
  end

  describe "When I visit '/missions/:id/edit'"
    it "Will show me a page to edit a Mission's information" do
      visit "/missions/#{@italy.id}/edit"

      expect(page).to have_content("Mission name:")
      expect(page).to have_content("Mission language:")
      expect(page).to have_content("Country:")
      expect(page).to have_content("Number of members baptized:")
      expect(page).to have_content("Foreign mission?")
    end

    it "will send a `PATCH` request to '/missions/:id' and update the info, redirecting to /missions/:id " do
      visit "/missions/#{@italy.id}/edit"
      fill_in("mission_name", with: "Tokyo, Japan")
      click_button

      expect(page.current_path).to eq("/missions/#{@italy.id}")
      expect(page).to have_content("Tokyo, Japan")
    end
end
