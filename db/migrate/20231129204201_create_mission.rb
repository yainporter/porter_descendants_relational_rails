class CreateMission < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.references :descendent, null: false, foreign_key: true
      t.string :mission_name
      t.string :mission_language
      t.string :country
      t.integer :members_baptized
      t.boolean :service_mission

      t.timestamps
    end
  end
end
