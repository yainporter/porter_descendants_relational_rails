# require "rails_helper"

# RSpec.describe "Grandchildren Index Page", type: :feature do
#   before(:each) do
#     @aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
#     @rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
#     @italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, foreign_mission: false)
#   end

#   describe "As a user" do
#     describe "when I visit '/grandchildren'" do
#       it "I see the name of each grandchild in the record system" do
#         @aaron.grandchildren.create(name: "Logan")
#         visit "/grandchildren"

#         expect(page).to have_content("Logan")
#       end
#     end
#   end
# end
