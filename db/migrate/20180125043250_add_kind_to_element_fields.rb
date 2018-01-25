class AddKindToElementFields < ActiveRecord::Migration[5.1]
  def change
    add_column :element_fields, :kind, :string
  end
end
