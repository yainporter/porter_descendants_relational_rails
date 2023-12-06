require "rails_helper"

RSpec.describe "Descendents Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
    @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
    @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, foreign_mission: false)
  end

  describe "when I visit '/descendents'" do ### MAKE THIS A FEATURE DESCERIPTION ####
    it "shows the name of each parent in the record system" do
      visit "/descendents"

      expect(page).to have_content(@rusty.first_name)
    end

    it "will show records ordered by recently created" do
      Descendent.create(first_name: "Yain", last_name: "Porter")
      Descendent.create(first_name: "Adeline", last_name: "Porter")
      visit "/descendents"

      expect("Yain Porter").to appear_before("Rusty Porter", only_text: false)
      expect("Adeline Porter").to appear_before("Yain Porter", only_text: false)
    end

    it "shows when Descendent was created" do
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

    it "shows a link to edit that descendent's info" do
      visit "/descendents"

      expect(page).to have_content("Edit Rusty Porter's Info")
      expect(page).to have_content("Edit Aaron Porter's Info")
    end

    it "will take me to 'descendents/:id/edit' when I click on the edit link" do
      visit "/descendents"
      click_link(id: "edit_#{@rusty.id}_link")

      expect(page.current_path).to eq("/descendents/#{@rusty.id}/edit")
    end

    it "will have a delete link next to every parent" do
      ####### How do I test for every parent? #######
      visit "/descendents"

      expect(page).to have_content("Delete")
    end

    it "will redirect to /descendents after deleting and no longer have the Descendent" do
      adeline = Descendent.create(first_name: "Adeline", last_name: "Porter", married: true, grandchildren: true)
      visit "/descendents"

      expect(page).to have_content("Adeline Porter")

      click_link(id: "delete_#{adeline.id}")

      expect(page.current_path).to eq("/descendents")
      expect(page).to have_no_content("Adeline Porter")

    end

    describe "Extension 1" do
      it "has a link to sort descendents by number of missions" do
        anna = Descendent.create(first_name: "Anna", last_name: "Porter", married: true, grandchildren: true)
        anna.missions.create(mission_name: "Spain")
        anna.missions.create(mission_name: "Louisiana")
        anna.missions.create(mission_name: "Florida")
        visit "/descendents"

        expect(page).to have_content("Sort by number of missions")
      end

      it "will refresh the page and sort descendents by number of missions ascending when the link is clicked" do
        anna = Descendent.create(first_name: "Anna", last_name: "Porter", married: true, grandchildren: true)
        anna.missions.create(mission_name: "Spain")
        anna.missions.create(mission_name: "Louisiana")
        anna.missions.create(mission_name: "Florida")
        visit "/descendents"
        click_link ("Sort by number of missions")

        expect(page.current_path).to eq("/descendents")
        expect(anna.full_name).to appear_before(@rusty.full_name)
        expect(anna.full_name).to appear_before(@aaron.full_name)
      end

      it "will have the number of missions next to the descendent once sorted" do
        anna = Descendent.create(first_name: "Anna", last_name: "Porter", married: true, grandchildren: true)
        anna.missions.create(mission_name: "Spain")
        anna.missions.create(mission_name: "Louisiana")
        anna.missions.create(mission_name: "Florida")
        visit "/descendents"

        expect(page).to have_no_content("Number of missions: 3")

        click_link ("Sort by number of missions")

        expect(page).to have_content("Number of missions: 3")
      end
    end

    describe "Extension 2: Search by name (exact match)" do
      it "will show a text box to filter results by keyword" do
        visit "/descendents"

        expect(page).to have_content("Filter results by first or last name")
      end

      it "will have a search button that returns results to the current page" do
        visit "/descendents"
        click_button("Filter")

        expect(page.current_path).to eq("/descendents")
      end

      it "will only return records that are an exact match of the filter" do
        amy = Descendent.create(first_name: "Amy", last_name: "Finder", birthday:"06/09/1988", married: true, allergies: false, languages: 1)
        caroyln = Descendent.create(first_name: "Carolyn", last_name: "Lines", birthday: "09/08/1995", married: false, allergies: true, languages: 1)
        robert = Descendent.create(first_name: "Robert", last_name: "Lines", birthday: "09/08/1995", married: false, allergies: true, languages: 1)
        visit "/descendents"

        fill_in("keyword", with: "Amy")
        click_button("Filter")

        expect(page).to have_content("Amy Finder")
        expect(page).to have_no_content("Aaron")
        expect(page).to have_no_content("Rusty")
        expect(page).to have_no_content("Lines")


        fill_in("keyword", with: "Lines")
        click_button("Filter")
        expect(page).to have_content("Carolyn Lines")
        expect(page).to have_content("Robert Lines")
        expect(page).to have_no_content("Amy")

      end
    end
  end
end
