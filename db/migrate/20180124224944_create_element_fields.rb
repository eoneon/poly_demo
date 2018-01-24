class CreateElementFields < ActiveRecord::Migration[5.1]
  def change
    create_table :element_fields do |t|
      t.string :name
      t.string :field_type
      
      t.timestamps
    end
  end
end
