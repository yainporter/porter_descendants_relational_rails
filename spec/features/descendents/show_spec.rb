RSpec.describe "Descendents Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
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

      it "Will show me a link top update the parent `Update Parent`" do
        visit "/descendents/#{@rusty.id}"

        expect(page).to have_content("Update #{@rusty.full_name}'s Info")
      end

      it "Will take me to '/parents/:id/edit' when I click on 'Update Descendent's Info'" do
        visit "/descendents/#{@rusty.id}"
        find("div").click_link("Update #{@rusty.full_name}'s Info")

        expect(page.current_path).to eq("/descendents/#{@rusty.id}/edit")
      end
    end
  end
end
