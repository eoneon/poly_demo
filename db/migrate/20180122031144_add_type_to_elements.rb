class AddTypeToElements < ActiveRecord::Migration[5.1]
  def change
    add_column :elements, :type, :string
  end
end
