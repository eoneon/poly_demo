class DropElementTwos < ActiveRecord::Migration[5.1]
  def change
    drop_table :element_twos
  end
end
