class AddTypeToSubElements < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_elements, :type, :string
  end
end
