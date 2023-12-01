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
    end
  end

  describe "As a user" do
    describe "When I visit '/descendents"
      it "Will show records ordered by recently created and when it was created" do

        visit "/descendents"
        expect("Aaron Porter").to appear_before("Rusty Porter", only_text: false)
      end
  end
end
