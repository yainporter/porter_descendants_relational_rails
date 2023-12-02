require "rails_helper"

RSpec.describe "Missions Index Page", type: :feature do
  describe "As a user" do
    describe "When I visit '/missions/:id'" do
      rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
      spain = rusty.missions.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)

      it "Will show the mission with that ID, including it's attributes" do

        visit "/missions/#{spain.id}"

        expect(page).to have_content(spain.mission_name)
        expect(page).to have_content(spain.mission_language)
        expect(page).to have_content(spain.country)
        expect(page).to have_content(spain.members_baptized)
        expect(page).to have_content(spain.service_mission?)
      end

      it "Will have a link at the top of the page that takes me to the Missions Index" do
        visit "/missions/#{spain.id}"

        expect(page).to have_content("Missions Index")

        find('nav').click_link("Missions Index")

        expect(page.current_path).to eq("/missions")
      end

      it "Will have a link at the top of the page that takes me to the Descendents Index" do
        visit "/missions/#{spain.id}"

        expect(page).to have_content("Descendants Index")

        find('nav').click_link("Descendants Index")

        expect(page.current_path).to eq("/descendents")
      end

      it "Will have a link to let me update the list of missions with each mission" do
        visit "/missions/#{spain.id}"

        expect(page).to have_content("Edit mission info")
      end
    end
  end
end
