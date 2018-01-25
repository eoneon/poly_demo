class AddKindToFieldValues < ActiveRecord::Migration[5.1]
  def change
    add_column :field_values, :kind, :string 
  end
end
