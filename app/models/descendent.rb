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

  def self.sort_by_number_of_missions
    Descendent.all.sort_by do |descendent|
      descendent.missions_served
    end.reverse
  end

  def self.filter_by(keyword)
    # if Descendent.where(first_name: keyword) != []
    #   Descendent.where(first_name: keyword)
    # elsif Descendent.where(last_name: keyword) != []
    #   Descendent.where(last_name: keyword)
    # else
    #   Descendent.all.order(created_at: :desc)
    # end

    Descendent.where("first_name = ? OR last_name = ?", keyword, keyword)
  end
end
