class RemoveTypeFromElementGroups < ActiveRecord::Migration[5.1]
  def change
    remove_column :element_groups, :kind
  end
end
