class Mission < ApplicationRecord
  def service_mission?
    service_mission == true ? "Yes" : "No"
  end

  def self.find_foreign_key(descendent)
    Mission.all.select do |mission|
      descendent[:id] == mission.foreign_id
    end.pop
  end

end
