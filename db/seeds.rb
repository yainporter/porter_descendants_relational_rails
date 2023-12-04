# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@aaron = Descendent.create(first_name: "Aaron", last_name: "Porter", married: true, grandchildren: true)
@amy = Descendent.create(first_name: "Amy", last_name: "Finder", birthday:"06/09/1988", married: true)
@alissa = Descendent.create(first_name: "Alissa", last_name: "Lines", birthday:"06/09/1988", married: true, grandchildren: true)
@dana = Descendent.create(first_name: "Dana", last_name: "Burnett", birthday:"06/09/1988", married: true, grandchildren: true)
@justin = Descendent.create(first_name: "Justin", last_name: "Porter", birthday:"06/09/1988", married: true)
@lee = Descendent.create(first_name: "Lee", last_name: "Porter", birthday:"06/09/1988", married: true)
@rusty = Descendent.create(first_name: "Rusty", last_name: "Porter", birthday:"06/09/1988", married: true)
@rayden = Descendent.create(first_name: "Rayden", last_name: "Porter", birthday: "09/08/1995", married: false)
@italy = @rusty.missions.create(mission_name:"Rome Italy", mission_language: "Italian", country: "Italy", members_baptized: 1, service_mission: true)
@pennsylvania = @aaron.missions.create(mission_name: "Pennyslvania", mission_language: "English", country: "United States", members_baptized: 10, service_mission: true)
@oaklahoma = @justin.missions.create(mission_name:"Tulsa, Oklahoma", mission_language: "English", country: "United States", members_baptized: 5, service_mission: true)
@brazil = @lee.missions.create(mission_name:"Riberão Preto", mission_language: "Portugese", country: "Brazil", members_baptized: 7, service_mission: true)
@spain = @aaron.missions.create(mission_name:"Madrid Spain", mission_language: "Spanish", country: "Spain", members_baptized: 11, service_mission: true)
@japan = @rayden.missions.create(mission_name: "Tokyo, Japan", mission_language: "Japanese", country: "Japan", members_baptized: 3, service_mission: true)
