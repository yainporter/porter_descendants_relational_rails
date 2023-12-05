require "rails_helper"

RSpec.describe "Grandchildren Index Page", type: :feature do
  before(:each) do
    @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true, allergies: true, languages: 1)
    @rayden = Descendent.create(first_name: "Rayden", last_name: "Porter", birthday: "09/08/1995", married: false, allergies: true, languages: 2, parent_id: @aaron.id)
    @rylee = Descendent.create(first_name: "Rylee", last_name: "Porter", birthday: "09/08/1995", married: true, allergies: true, languages: 1, parent_id: @aaron.id)
    @morgan = Descendent.create(first_name: "Morgan", last_name: "Porter", birthday: "09/08/1995", married: false, allergies: true, languages: 1, parent_id: @aaron.id)
    @halee = Descendent.create(first_name: "Halee", last_name: "Porter", birthday: "09/08/1995", married: false, allergies: false, languages: 2, parent_id: @aaron.id)
    @brett = Descendent.create(first_name: "Brett", last_name: "Porter", birthday: "09/08/1995", married: false, allergies: true, languages: 1, parent_id: @aaron.id)
    @logan = Descendent.create(first_name: "Logan", last_name: "Porter", birthday: "09/08/1995", married: false, allergies: false, languages: 2, parent_id: @aaron.id)
  end
  describe "when I visit '/grandchildren'" do
    it "I see the name of each grandchild in the record system" do
      visit "/grandchildren"
      
      expect(page).to have_content("Logan")
    end
  end
end
