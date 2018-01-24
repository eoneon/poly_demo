class CreateFieldValues < ActiveRecord::Migration[5.1]
  def change
    create_table :field_values do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
