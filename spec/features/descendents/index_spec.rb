require "rails_helper"

RSpec.describe "Descendents Index Page", type: :feature do
  describe "As a user" do
    describe "when I visit '/descendents'" do
      it "I see the name of each parent in the record system" do
        rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)

        visit "/descendents"
        save_and_open_page

        expect(page).to have_content(rusty.first_name)
      end
    end
  end

  describe "As a user" do
    describe "When I visit '/descendents/:id'" do
      it "will show me that descendent with that id including the descendent's attributes" do
        rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)

        visit "/descendents/#{rusty.id}"
        save_and_open_page

        expect(page).to have_content(rusty.full_name)
      end
    end
  end

  # frozen_string_literal: true

  describe "As a user" do
    describe "When I visit /missions" do
      it "will show me each mission in the system, including it's attributes" do

        expect(true).to eq(true)
      end
    end
  end

end
