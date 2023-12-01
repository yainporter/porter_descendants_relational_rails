require "rails_helper"

RSpec.describe "Descendents Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
  end

  describe "As a user" do
    describe "when I visit '/descendents'" do
      it "I see the name of each parent in the record system" do
        visit "/descendents"

        expect(page).to have_content(@rusty.first_name)
      end

      it "Will show records ordered by recently created" do
        visit "/descendents"

        expect("Aaron Porter").to appear_before("Rusty Porter", only_text: false)
      end

      it "Will show when Descendent was created" do
        visit "/descendents"

        expect(page).to have_content(@aaron[:created_at])
        expect(page).to have_content(@rusty[:created_at])
      end

      it "Will have a link at the top of the page that takes me to the Missions Index" do
        visit "/descendents"

        expect(page).to have_content("Missions Index")

        find('nav').click_link("Missions Index")

        expect(page.current_path).to eq("/missions")
      end

      it "Will have a link at the top of the page that takes me to the Descendents Index" do
        visit "/descendents"

        expect(page).to have_content("Descendants Index")

        find('nav').click_link("Descendants Index")

        expect(page.current_path).to eq("/descendents")
      end
    end
  end

  describe "As a user" do
    describe "When I visit '/descendents/:id'" do

      it "will show me that descendent with that id including the descendent's attributes" do
        visit "/descendents/#{@rusty.id}"

        expect(page).to have_content(@rusty.full_name)
      end

      it "will show me a count of the number of missions associated with the descendent" do
        visit "/descendents/#{@rusty.id}"

        expect(page).to have_content("Number of missions served: 1")
      end

      it "Will have a link at the top of the page that takes me to the Missions Index" do
        visit "/descendents/#{@rusty.id}"

        expect(page).to have_content("Missions Index")

        find('nav').click_link("Missions Index")

        expect(page.current_path).to eq("/missions")
      end

      it "Will have a link at the top of the page that takes me to the Descendents Index" do
        visit "/descendents/#{@rusty.id}"

        expect(page).to have_content("Descendants Index")

        find('nav').click_link("Descendants Index")

        expect(page.current_path).to eq("/descendents")
      end

      it "Will show me a link to take me to that Descendents mission page" do
        visit "/descendents/#{@rusty.id}"

        expect(page).to have_content("#{@rusty.full_name}'s Mission")

        find("p").click_link("Mission")

        expect(page.current_path).to eq("/descendents/#{@rusty.id}/missions")
      end
    end
  end

  describe "As a user" do
    describe "When I visit '/descendents/:id/missions" do
      it "Will show each mission that is associated with that descendent with the mission attributes" do

        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_content(@rusty.full_name)
        expect(page).to have_content(@italy.mission_name)
        expect(page).to have_content(@italy.mission_language)
        expect(page).to have_content(@italy.country)
        expect(page).to have_content(@italy.members_baptized)
        expect(page).to have_content(@italy.service_mission?)
      end

      it "Will have a link at the top of the page that takes me to the Missions Index" do
        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_content("Missions Index")

        find('nav').click_link("Missions Index")

        expect(page.current_path).to eq("/missions")
      end

      it "Will have a link at the top of the page that takes me to the Descendents Index" do
        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_content("Descendants Index")

        find('nav').click_link("Descendants Index")

        expect(page.current_path).to eq("/descendents")
      end
    end
  end
end
