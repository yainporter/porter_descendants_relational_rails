# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
@rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
@italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: false)
@spain = @aaron.missions.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: false)
