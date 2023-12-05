class AddGrandparentIdToDescendents < ActiveRecord::Migration[7.0]
  def change
    add_reference :descendents, :descendents, null: true, foreign_key: true
  end
end
