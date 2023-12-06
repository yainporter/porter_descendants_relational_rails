require "rails_helper"

RSpec.describe "Missions Index Page", type: :feature do
  before(:each) do
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, foreign_mission: true)
    @spain = @rusty.missions.create(mission_name:"Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, foreign_mission: true)
    @gilbert = @rusty.missions.create(mission_name:"Gilbert", mission_language: "English", country: "USA", members_baptized: 11, foreign_mission: true)
  end
  describe "As a user" do
    describe "When I visit /missions" do
      it "will show me each mission in the system, including it's attributes" do
        visit "/missions"

        spain = @rusty.missions.create(mission_name:"Spaino", mission_language: "Spanish", country: "Spain", members_baptized: 11, foreign_mission: false)
        italy = @rusty.missions.create(mission_name:"Italyi", mission_language: "Italian", country: "Italy", members_baptized: 11, foreign_mission: false)
        ####### Do we really only want to display service missions only?#######
        expect(page).to have_no_content(italy.mission_name)
        expect(page).to have_no_content(spain.mission_name)
        expect(page).to have_content(@gilbert.mission_name)
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

      it "Will only show the boolean column when the value is `true`" do

        spain = @rusty.missions.create(mission_name:"Spaino", mission_language: "Spanish", country: "Spain", members_baptized: 11, foreign_mission: false)

        visit "/missions"

        expect(page).to have_content("#{@gilbert.mission_name}")
        expect(page).to have_no_content("#{spain.mission_name}")
      end

      it "shows a link to edit that mission's info" do
        visit "/missions"

        expect(page).to have_content("Edit Gilbert's Mission Info")
      end

      it "will take me to 'missions/:id/edit' when I click on the edit link" do
        visit "/missions"
        click_link(id: "edit_#{@gilbert.id}_link")

        expect(page.current_path).to eq("/missions/#{@gilbert.id}/edit")
      end

      it "will have a link next to every mission that will delete the mission" do

        #### Untested every mission with delete #####
        mission = @rusty.missions.create(mission_name:"Random Mission", mission_language: "English", country: "USA", members_baptized: 11, foreign_mission: true)
        visit "/missions"

        expect(page).to have_content("Random Mission")

        click_link(id: "delete_#{mission.mission_name}")

        expect(page.current_path).to eq("/missions")
        expect(page).to have_no_content("Random Mission")
      end
    end

    describe "Extension 2: Search by name (exact match)" do
      it "will show a text box to filter results by keyword" do
        visit "/missions"

        expect(page).to have_content("Filter results by mission name country or language")
      end

      it "will have a search button that returns results to the current page" do
        visit "/missions"
        click_button("Filter")

        expect(page.current_path).to eq("/missions")
      end

      it "will only return records that are an exact match of the filter" do

        visit "/missions"

        fill_in("keyword", with: "Spain")
        click_button("Filter")

        expect(page).to have_content("Spain")
        expect(page).to have_no_content("Italy")
        expect(page).to have_no_content("Gilbert")

        fill_in("keyword", with: "Gilbert")
        click_button("Filter")
        expect(page).to have_no_content("Spain")
        expect(page).to have_content("Gilbert")
        expect(page).to have_no_content("Italy")

      end
    end
  end


end
