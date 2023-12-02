require "rails_helper"

RSpec.describe "Descendents Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
  end

  describe "As a user" do
    describe "when I visit '/descendents'" do
      it "I see the name of each parent in the record system" do
        visit "/descendents"
        save_and_open_page
        expect(page).to have_content(@rusty.first_name)
      end

      it "Will show records ordered by recently created" do
        Descendent.create(first_name: "Yain", last_name: "Porter")
        Descendent.create(first_name: "Adeline", last_name: "Porter")
        visit "/descendents"

        expect("Yain Porter").to appear_before("Rusty Porter", only_text: false)
        expect("Adeline Porter").to appear_before("Yain Porter", only_text: false)
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

      it "will show me a link to create a 'New Descendent'" do
        visit "/descendents"

        expect(page).to have_content("New Descendent")
      end

      it "clicking 'New Descendent' will take me to '/descdendents/new'" do
        visit "/descendents"
        find('p').click_link("New Descendent")

        expect(page.current_path).to eq("/descendents/new")
      end
    end
  end
end
