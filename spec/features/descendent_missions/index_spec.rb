require "rails_helper"

RSpec.describe "Descendent Missions Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, foreign_mission: false)
    @spain = @rusty.missions.create(mission_name:"Madrid, Spain", mission_language: "Italian", country: "Spain", members_baptized: 1, foreign_mission: false)
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
        expect(page).to have_content(@italy.foreign_mission?)
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

      # Then I see a link to add a new adoptable child for that parent "Create Child"
      # When I click the link
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      # When I fill in the form with the child's attributes:
      # And I click the button "Create Child"
      # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
      # a new child object/row is created for that parent,
      # and I am redirected to the Parent Childs Index page where I can see the new child listed

      it "Will show me a link to add a mission for that descendent" do
        #### USER STORY 13 #####
        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_content("Create Mission")
      end

      it "Will redirect to '/descendents/:id/missions/new' when I click on 'Create Mission'" do
        #### USER STORY 13 #####
        visit "/descendents/#{@rusty.id}/missions"
        find('div').click_link("Create Mission")

        expect(page.current_path).to eq("/descendents/#{@rusty.id}/missions/new")
      end

      it "Will show a link to sort the missions in alphabetical order" do
        visit "/descendents/#{@rusty.id}/missions"
        click_link("Sort Alphabetically")

        expect(@spain.mission_name).to appear_before(@italy.mission_name)
      end

      it "shows a link to edit that mission's info" do
        visit "/descendents/#{@rusty.id}/missions"
        expect(page).to have_content("Edit #{@spain.mission_name}'s Mission Info")
        expect(page).to have_content("Edit #{@italy.mission_name}'s Mission Info")
      end

      it "will take me to 'descendents/:id/edit' when I click on the edit link" do
        visit "/descendents/#{@rusty.id}/missions"

        click_link(id: "edit_#{@spain.id}_link")

        expect(page.current_path).to eq("/missions/#{@spain.id}/edit")
      end

      it "Will have a form that allows me to input a value with a submit button" do
        #### US 21 ####
        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_button("Filter")
        expect(page).to have_field()
      end

      it "Will take me back to the current index page with only the records that meet the threshold from the submit button" do
        #### US 21 ####
        @rusty.missions.create(mission_name:"Tokyo", mission_language: "Italian", country: "Spain", members_baptized: 5, foreign_mission: false)
        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_content("Rome Italy")
        expect(page).to have_content("Madrid, Spain")
        expect(page).to have_content("Tokyo")

        fill_in :number, with: "2"
        click_button

        expect(page.current_path).to eq("/descendents/#{@rusty.id}/missions")
        expect(page).to have_no_content("Rome Italy")
        expect(page).to have_no_content("Madrid, Spain")
        expect(page).to have_content("Tokyo")
      end

      it "will show a link to delete each mission and redirect to '/missions" do
        mission = @rusty.missions.create(mission_name:"Russia Mission", mission_language: "English", country: "USA", members_baptized: 11, foreign_mission: true)
        mission_2 = @rusty.missions.create(mission_name:"Random Mission 2", mission_language: "English", country: "USA", members_baptized: 11, foreign_mission: true)
        visit "/descendents/#{@rusty.id}/missions"

        expect(page).to have_content("Russia Mission")
        expect(page).to have_content("Random Mission 2")

        click_link(id: "delete_#{mission.mission_name}")

        expect(page.current_path).to eq("/missions")
        expect(page).to have_no_content("Russia Mission")

        click_link(id: "delete_#{mission_2.mission_name}")

        expect(page.current_path).to eq("/missions")
        expect(page).to have_no_content("Random Mission 2")

      end
    end
  end
end
