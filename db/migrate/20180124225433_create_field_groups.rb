class CreateFieldGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :field_groups do |t|
      t.references :sub_element, index: true, foreign_key: true
      t.references :element_field, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
