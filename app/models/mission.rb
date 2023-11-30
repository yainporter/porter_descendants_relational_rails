class Mission < ApplicationRecord
  def service_mission?
    service_mission == true ? "Yes" : "No"
  end
end
