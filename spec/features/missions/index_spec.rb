require "rails_helper"

RSpec.describe "Missions Index Page", type: :feature do
  describe "As a user" do
    describe "When I visit /missions" do
      it "will show me each mission in the system, including it's attributes" do
        rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
        italy = rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
        spain = rusty.missions.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)

        visit "/missions"

        expect(page).to have_content(italy.mission_name)
        expect(page).to have_content(spain.mission_name)
      end

      it "Will have a link at the top of the page that takes me to the Missions Index" do
        visit "/missions"

        expect(page).to have_content("Missions Index")

        find('nav').click_link("Missions Index")

        expect(page.current_path).to eq("/missions")
      end

      it "Will have a link at the top of the page that takes me to the Descendents Index" do
        visit "/missions"

        expect(page).to have_content("Descendants Index")

        find('nav').click_link("Descendants Index")

        expect(page.current_path).to eq("/descendents")
      end
    end
  end


end
