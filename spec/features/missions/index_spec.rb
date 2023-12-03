require "rails_helper"

RSpec.describe "Missions Index Page", type: :feature do
  before(:each) do
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
    @spain = @rusty.missions.create(mission_name:"Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)
    @gilbert = @rusty.missions.create(mission_name:"Gilbert", mission_language: "English", country: "USA", members_baptized: 11, service_mission: true)
  end
  describe "As a user" do
    describe "When I visit /missions" do
      it "will show me each mission in the system, including it's attributes" do
        visit "/missions"

        ####### Do we really only want to display service missions only?#######
        expect(page).to have_no_content(@italy.mission_name)
        expect(page).to have_no_content(@spain.mission_name)
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


        visit "/missions"

        expect(page).to have_content("#{@gilbert.mission_name}")
        expect(page).to have_no_content("#{@spain.mission_name}")
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
    end
  end


end
