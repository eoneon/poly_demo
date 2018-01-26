class AddSubKindToFieldValues < ActiveRecord::Migration[5.1]
  def change
    add_column :field_values, :sub_kind, :string
  end
end
