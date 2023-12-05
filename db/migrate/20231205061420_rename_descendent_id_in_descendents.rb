class RenameDescendentIdInDescendents < ActiveRecord::Migration[7.0]
  def change
    rename_column :descendents, :descendents_id, :grandparent_id
  end
end
