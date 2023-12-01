class Descendent < ApplicationRecord
  has_many :missions

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
end
