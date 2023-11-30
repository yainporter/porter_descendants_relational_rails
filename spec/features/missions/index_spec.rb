require "rails_helper"

RSpec.describe "Missions Index Page", type: :feature do
  describe "As a user" do
    describe "When I visit /missions" do
      it "will show me each mission in the system, including it's attributes" do
        italy = Mission.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
        spain = Mission.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)

        visit "/missions"

        expect(page).to have_content(italy.mission_name)
        expect(page).to have_content(spain.mission_name)
      end
    end
  end

  describe "As a user" do
    describe "When I visit '/missions/:id'" do
      it "Will show the mission with that ID, including it's attributes" do
        spain = Mission.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)

        visit "/missions/#{spain.id}"
        save_and_open_page

        expect(page).to have_content(spain.mission_name)
        expect(page).to have_content(spain.mission_language)
        expect(page).to have_content(spain.country)
        expect(page).to have_content(spain.members_baptized)
        expect(page).to have_content(spain.service_mission?)
      end
    end
  end
end
