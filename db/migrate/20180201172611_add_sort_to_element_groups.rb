class AddSortToElementGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :element_groups, :sort, :integer
  end
end
