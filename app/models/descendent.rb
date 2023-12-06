class Descendent < ApplicationRecord
  has_many :missions
  # has_many :descendents

  def full_name
    first_name + " " + last_name
  end

  def allergies?
    allergies == true ? "Yes" : "No"
  end

  def grandchildren?
    grandchildren == true ? "Yes" : "No"
  end

  def married?
    married == true ? "Yes" : "No"
  end

  def missions_served
    missions.count
  end

  def self.destroy_descendent_and_missions(params_id)
    descendent = Descendent.find(params_id)
    descendent.missions.each{|mission| mission.destroy}
    descendent.destroy
  end


  def self.sort_by_number_of_missions
    Descendent.all.sort_by do |descendent|
      descendent.missions_served
    end.reverse
  end

  def self.sort_by_creation
    Descendent.all.order(created_at: :desc)
  end

  def self.filter_by(keyword)
    Descendent.where("first_name = ? OR last_name = ?", keyword, keyword)
  end
end
