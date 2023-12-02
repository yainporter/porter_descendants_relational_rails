require "rails_helper"

RSpec.describe "Descendent Missions Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
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
    end
  end
end
