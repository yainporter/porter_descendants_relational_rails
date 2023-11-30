require "rails_helper"

RSpec.describe "Descendents Index Page", type: :feature do
  describe "As a user" do
    describe "when I visit '/descendents'" do
      it "I see the name of each parent in the record system" do
        rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)

        visit "/descendents"

        expect(page).to have_content(rusty.first_name)
      end
    end
  end

  describe "As a user" do
    describe "When I visit '/descendents/:id'" do
      it "will show me that descendent with that id including the descendent's attributes" do
        rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)

        visit "/descendents/#{rusty.id}"

        expect(page).to have_content(rusty.full_name)
      end
    end
  end

  describe "As a user" do
    describe "When I visit '/descendents/:id/missions" do
      it "Will show each mission that is associated with that descendent with the mission attributes" do
        
      end
    end
  end
end
