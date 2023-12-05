class AddParentIdToDescendents < ActiveRecord::Migration[7.0]
  def change
    add_reference :descendents, :descendent, null: true, foreign_key: true
  end
end
