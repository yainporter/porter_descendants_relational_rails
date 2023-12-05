class RenameOldColumnNameInDescendents < ActiveRecord::Migration[7.0]
  def change
    rename_column :descendents, :descendent_id, :parent_id
  end
end
