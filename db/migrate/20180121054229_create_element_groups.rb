class CreateElementGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :element_groups do |t|
      t.references :elementable, polymorphic: true
      
      t.timestamps
    end
  end
end
