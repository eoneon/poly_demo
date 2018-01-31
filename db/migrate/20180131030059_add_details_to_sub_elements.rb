class AddDetailsToSubElements < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_elements, :kind, :string
    add_column :sub_elements, :sub_kind, :string
  end
end
