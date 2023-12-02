require "rails_helper"

RSpec.describe "Descendent Missions New Page", type: :feature do
  describe "When I visit /missions/new" do
    it "creates a new mission record sent to /missions when I fill out the form and click the button" do
        @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
        visit "/descendents/#{@rusty.id}/missions/new"
        fill_in("mission_name", with: "Tokyo Japan")
        fill_in("mission_language", with: "Japanese")
        fill_in("country", with: "Japan")
        fill_in("members_baptized", with: "3")
        choose("nservice_mission")
        click_button

        expect(page.current_path).to eq("/descendents/#{@rusty.id}/missions")
        expect(page).to have_content("Tokyo Japan")
        expect(page).to have_content("Japanese")
        expect(page).to have_content("Japanese")
        expect(page).to have_content("3")

    end
  end
end
