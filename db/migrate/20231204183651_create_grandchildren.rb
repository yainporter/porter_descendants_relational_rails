class CreateGrandchildren < ActiveRecord::Migration[7.0]
  def change
    create_table :grandchildren do |t|
      t.references :descendent, null: false, foreign_key: true
      t.string :name
      t.boolean :lives_at_home
      t.integer :age
      t.string :hobbies
      t.string :location
      t.text :fun_fact
      
      t.timestamps
    end
  end
end
