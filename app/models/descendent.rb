class Descendent < ApplicationRecord
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
end
