class CreateElementTwos < ActiveRecord::Migration[5.1]
  def change
    create_table :element_twos do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
