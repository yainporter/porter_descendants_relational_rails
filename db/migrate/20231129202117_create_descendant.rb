class CreateDescendant < ActiveRecord::Migration[7.0]
  def change
    create_table :descendants do |t|
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.string :datetime
      t.boolean :allergies
      t.integer :languages
      t.boolean :married
      t.boolean :grandchildren

      t.timestamps
    end
  end
end
