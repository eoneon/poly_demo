class AddKindToElementFields < ActiveRecord::Migration[5.1]
  def change
    add_column :elements, :kind, :string 
  end
end
