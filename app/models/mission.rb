class Mission < ApplicationRecord
  belongs_to :descendent

  def foreign_mission?
    foreign_mission == true ? "Yes" : "No"
  end

  # def self.find_foreign_key(descendent)
  #   Mission.all.select do |mission|
  #     descendent[:id] == mission.descendent_id
  #   end.pop

  #   Mission.where(descendent_id: descendent_id)
  # end

end
