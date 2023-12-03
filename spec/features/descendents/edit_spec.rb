require "rails_helper"

RSpec.describe "Descendents Edit Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
  end

  describe "As a user" do
    describe "/descendents/:id}/edit" do
      it "will show me a page to edit a Descendent's information" do
        visit "/descendents/#{@rusty.id}/edit"

        expect(page).to have_content("Edit #{@rusty.full_name}'s Information")
        expect(page).to have_content("First name:")
        expect(page).to have_content("Last name:")
        expect(page).to have_content("Birthday:")
        expect(page).to have_content("Allergies?")
        expect(page).to have_content("Languages:")
        expect(page).to have_content("Married?")
        expect(page).to have_content("Grandchildren?")
        expect(page.has_button?).to be true
        expect(page).to have_button("Update #{@rusty.full_name}'s Info")
        expect(page.has_unchecked_field?). to be true
      end
#       When I fill out the form with updated information
#       And I click the button to submit the form
#       then a `PATCH` request is sent to '/parents/:id',
#       the parent's info is updated,
#       and I am redirected to the Parent's Show page where I see the parent's updated info

      it "will send a `PATCH` request to '/descendents/:id' and update the info, redirecting to /descendents/:id " do
        visit "/descendents/#{@rusty.id}/edit"
        fill_in("fname", with: "Alissa")
        click_button

        expect(page.current_path).to eq("/descendents/#{@rusty.id}")
        expect(page).to have_content("Alissa")
      end
    end
  end
end
