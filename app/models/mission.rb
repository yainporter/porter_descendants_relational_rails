class Mission < ApplicationRecord
  belongs_to :descendent

  def foreign_mission?
    foreign_mission == true ? "Yes" : "No"
  end

  def self.filter_by(keyword)
    if Mission.where(mission_name: keyword) != []
      Mission.where(mission_name: keyword)
    elsif Mission.where(mission_language: keyword) != []
      Mission.where(mission_language: keyword)
    elsif Mission.where(country: keyword) != []
      Mission.where(country: keyword)
    else
      Mission.all.order(created_at: :desc)
    end
  end
end
