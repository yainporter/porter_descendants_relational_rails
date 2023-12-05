class RenameServiceMissionInMissions < ActiveRecord::Migration[7.0]
  def change
    rename_column :missions, :service_mission, :foreign_mission
  end
end
