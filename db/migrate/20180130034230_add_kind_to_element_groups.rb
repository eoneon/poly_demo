class AddKindToElementGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :element_groups, :kind, :string
  end
end
