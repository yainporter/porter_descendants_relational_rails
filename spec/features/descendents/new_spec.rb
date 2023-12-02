require "rails_helper"

RSpec.describe "Descendents New Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
  end

  describe "As a user" do
    describe "When I visit 'descendents/new'" do
      it "shows me a form for a new descendent record" do
        visit "/descendents/new"

        expect(page).to have_content("First name:")
        expect(page).to have_content("Last name:")
        expect(page).to have_content("Birthday:")
        expect(page).to have_content("Allergies?")
        expect(page).to have_content("Languages:")
        expect(page).to have_content("Married?")
        expect(page).to have_content("Grandchildren?")
        expect(page.has_button?).to be true
        expect(page).to have_button("Create Descendant")
        expect(page.has_unchecked_field?). to be true
      end

      it "creates a new Descendent record sent to /descendents when I fill out the form and click the button" do
        visit "/descendents/new"
        fill_in("fname", with: "Alissa")
        fill_in("lname", with: "Lines")
        fill_in("lang", with: "0")
        fill_in("bdate", with: "09/12/1971")
        choose("yallergies")
        choose("ymarried")
        choose("ygrandchildren")

        click_button

        expect(page.current_path).to eq("/descendents")
        expect(page).to have_content("Alissa Lines")
      end
    end
  end
end
